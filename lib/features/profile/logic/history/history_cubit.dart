import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/profile/data/models/submissions/submission_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/profile_repository.dart';

part 'history_state.dart';
part 'history_cubit.freezed.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._repository) : super(HistoryState.initial());

  final IProfileRepository _repository;

  // Cache keyed by filter (e.g., 'ALL', 'PENDING', 'APPROVED')
  // You can later extend key to "$filter|$search" if search should be cached too
  final Map<String, _CachedData> _cache = {};

  // Keep track of current filter and search for cache key logic
  String _currentFilter = 'ALL';
  String _currentSearch = '';

  Future<void> getSubmissionHistory({bool loadMore = false}) async {
    // If loading more, we must be in loaded state
    if (loadMore) {
      if (state is! _Loaded || (state as _Loaded).isLoading) return;
    }

    final cacheKey =
        _currentFilter; // Could be enhanced to include search if needed

    // Determine next page
    final cached = _cache[cacheKey];
    final nextPage = loadMore ? (cached?.nextPage ?? 1) : 1;

    // If not loading more and we have cached data for this filter, restore it immediately
    if (!loadMore && cached != null && cached.hasData) {
      emit(
        HistoryState.loaded(
          isLoading: false,
          isError: false,
          page: cached.currentPage,
          filter: _currentFilter,
          search: _currentSearch,
          history: cached.history,
          errorMsg: null,
          hasMore: cached.hasMore,
        ),
      );
    } else {
      // Show loading only if it's a fresh load (not pagination)
      if (!loadMore) {
        emit(HistoryState.loading());
      } else {
        emit((state as _Loaded).copyWith(isLoading: true));
      }
    }

    try {
      final List<SubmissionModel> response = await _repository.getSubmissions(
        search: _currentSearch,
        page: nextPage,
        filter: _currentFilter,
      );

      final List<SubmissionModel> newHistory = loadMore
          ? [...(cached?.history ?? []), ...response]
          : response;
      final hasMore =
          response.isNotEmpty; // Assume empty list means no more pages

      // Update cache
      _cache[cacheKey] = _CachedData(
        history: newHistory,
        currentPage: nextPage,
        nextPage: hasMore ? nextPage + 1 : nextPage,
        hasMore: hasMore,
        hasData: true,
      );

      emit(
        HistoryState.loaded(
          isLoading: false,
          isError: false,
          page: nextPage,
          filter: _currentFilter,
          search: _currentSearch,
          history: newHistory,
          errorMsg: null,
          hasMore: hasMore,
        ),
      );
    } catch (e) {
      if (loadMore) {
        emit(
          (state as _Loaded).copyWith(
            isLoading: false,
            isError: true,
            errorMsg: e.toString(),
          ),
        );
      } else {
        emit(HistoryState.error(e.toString()));
      }
      rethrow;
    }
  }

  void updateFilter(String filter) {
    if (_currentFilter == filter) return;

    _currentFilter = filter;
    _currentSearch = ''; // Optional: reset search when filter changes

    // Try to restore from cache immediately
    final cached = _cache[filter];
    if (cached != null && cached.hasData) {
      emit(
        HistoryState.loaded(
          isLoading: false,
          isError: false,
          page: cached.currentPage,
          filter: filter,
          search: _currentSearch,
          history: cached.history,
          errorMsg: null,
          hasMore: cached.hasMore,
        ),
      );
    } else {
      // Fresh load
      getSubmissionHistory();
    }
  }

  void updateSearch(String query) {
    if (_currentSearch == query) return;

    _currentSearch = query;

    // Search invalidates cache — clear all or just current filter's cache
    _cache.clear(); // Or just _cache.remove(_currentFilter);

    // Always refresh on search
    getSubmissionHistory();
  }

  // Call this to load next page
  Future<void> loadMore() async {
    final currentState = state;
    if (currentState is! _Loaded) return;
    if (currentState.isLoading || !currentState.hasMore) return;

    await getSubmissionHistory(loadMore: true);
  }
}

// Helper class to hold cached data
class _CachedData {
  final List<SubmissionModel> history; // Replace with your actual type
  final int currentPage;
  final int nextPage;
  final bool hasMore;
  final bool hasData;

  _CachedData({
    required this.history,
    required this.currentPage,
    required this.nextPage,
    required this.hasMore,
    required this.hasData,
  });
}
