import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/feed_repository.dart';
import 'question_state.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  final IFeedRepository _repository;

  QuestionCubit(this._repository) : super(const QuestionState());

  Future<void> loadLikeStatus(String questionId) async {
    try {
      final status = await _repository.getLikeStatus(questionId);
      emit(state.copyWith(
        likesCount: status['likes'] ?? 0,
        isLiked: status['isLiked'] ?? false,
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> toggleLike(String questionId) async {
    if (state.isLoadingLike) return;

    // Optimistic update
    final previousLikesCount = state.likesCount;
    final previousIsLiked = state.isLiked;
    
    emit(state.copyWith(
      isLoadingLike: true,
      isLiked: !state.isLiked,
      likesCount: state.isLiked ? state.likesCount - 1 : state.likesCount + 1,
    ));

    try {
      await _repository.toggleLike(questionId);
      emit(state.copyWith(isLoadingLike: false));
    } catch (e) {
      // Revert on error
      emit(state.copyWith(
        isLoadingLike: false,
        isLiked: previousIsLiked,
        likesCount: previousLikesCount,
        error: e.toString(),
      ));
    }
  }

  Future<void> loadComments(String questionId) async {
    emit(state.copyWith(isLoadingComments: true));
    try {
      final comments = await _repository.getComments(questionId);
      emit(state.copyWith(
        comments: comments,
        isLoadingComments: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingComments: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> postComment(String questionId, String content) async {
    if (state.isPostingComment) return;

    emit(state.copyWith(isPostingComment: true));
    try {
      final newComment = await _repository.postComment(questionId, content);
      final updatedComments = [newComment, ...state.comments];
      emit(state.copyWith(
        comments: updatedComments,
        isPostingComment: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isPostingComment: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> submitAnswer(String questionId, int selectedOption) async {
    try {
      await _repository.submitAnswer(questionId, selectedOption);
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

  Future<void> loadBookmarkStatus(String questionId) async {
    try {
      final status = await _repository.getBookmarkStatus(questionId);
      emit(state.copyWith(
        isBookmarked: status['isBookmarked'] ?? false,
      ));
    } catch (e) {
      // Silently fail for now or log error
      debugPrint('Error loading bookmark status: $e');
    }
  }

  Future<void> toggleBookmark(String questionId) async {
    if (state.isLoadingBookmark) return;

    final previousIsBookmarked = state.isBookmarked;
    
    emit(state.copyWith(
      isLoadingBookmark: true,
      isBookmarked: !state.isBookmarked,
    ));

    try {
      await _repository.toggleBookmark(questionId);
      emit(state.copyWith(isLoadingBookmark: false));
    } catch (e) {
      emit(state.copyWith(
        isLoadingBookmark: false,
        isBookmarked: previousIsBookmarked,
        error: e.toString(),
      ));
    }
  }

  Future<void> reportQuestion(String questionId) async {
    if (state.isReporting) return;

    emit(state.copyWith(isReporting: true));

    try {
      await _repository.reportQuestion(questionId, 'Inappropriate content');
      emit(state.copyWith(
        isReporting: false,
        isReported: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        isReporting: false,
        error: e.toString(),
      ));
    }
  }
}
