// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/feed_repository.dart';
import '../data/question_model.dart';
part 'feed_cubit.freezed.dart';
part 'feed_state.dart';
part 'feed_cubit.g.dart';

@injectable
class FeedCubit extends HydratedCubit<FeedState> {
  final IFeedRepository _repository;

  int _index = 0;
  FeedCubit(this._repository) : super(const FeedState.initial());

  Future<void> loadQuestions() async {
    // when state is Loading just return dont do anything
    if (state is _Loading) {
      return;
    }
    // when State is initial emit loading and get the questions and assign

    if (state is _Initial) {
      emit(const FeedState.loading());
    } else {
      emit(FeedState.loaded((state as _Loaded).questions, loading: true));
    }

    // when state is Loaded emit loading with Loaded state and get questions and append
    try {
      final questions = await _repository.getQuestions();
      if (state is _Loaded) {
        emit(
          FeedState.loaded(
            (state as _Loaded).questions + questions,
            loading: false,
          ),
        );
      } else {
        emit(FeedState.loaded(questions, loading: false));
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint(e.toString());
      if (state is _Loaded) {
        emit(
          FeedState.loaded((state as _Loaded).questions, error: e.toString()),
        );
      } else {
        emit(FeedState.error(e.toString()));
      }
      rethrow;
    }
  }

  void preserveQuestionIndex(int index) {
    _index = index;
  }

  @override
  FeedState? fromJson(Map<String, dynamic> json) {
    return FeedState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FeedState state) {
    if (state is _Loaded) {
      return FeedState.loaded(state.questions.sublist(_index)).toJson();
    }
    return null;
  }
}
