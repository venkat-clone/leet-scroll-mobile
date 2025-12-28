import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/feed/data/streek/streek_model.dart';
import 'package:mobile/features/profile/data/profile_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';
part 'home_cubit.g.dart';

@injectable
class HomeCubit extends HydratedCubit<HomeState> {
  HomeCubit(this._repository) : super(const HomeState.initial());
  final IProfileRepository _repository;

  void loadUserActivity() async {
    try {
      if (state is _Loaded) {
        emit((state as _Loaded).copyWith(refreshing: true));
      } else {
        emit(HomeState.loading());
      }
      final data = await _repository.getUserActivity();
      emit(HomeState.loaded(data: data));
    } catch (e, s) {
      if (state is! _Loaded) {
        emit(HomeState.error(e.toString()));
      } else {
        emit(
          (state as _Loaded).copyWith(error: e.toString(), refreshing: false),
        );
      }
      debugPrintStack(stackTrace: s);
      debugPrint(e.toString());
      // rethrow;
    }
  }

  @override
  fromJson(Map<String, dynamic> json) {
    try {
      return HomeState.fromJson(json);
    } catch (e) {
      return HomeState.initial();
    }
  }

  @override
  Map<String, dynamic>? toJson(state) {
    if (state is _Loaded) {
      return state.toJson();
    }
    return null;
  }
}
