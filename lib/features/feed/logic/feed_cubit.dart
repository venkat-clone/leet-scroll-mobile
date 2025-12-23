import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../data/feed_repository.dart';
import 'feed_state.dart';

@injectable
class FeedCubit extends Cubit<FeedState> {
  final IFeedRepository _repository;

  FeedCubit(this._repository) : super(const FeedState.initial());

  Future<void> loadQuestions() async {
    emit(const FeedState.loading());
    try {
      final questions = await _repository.getQuestions();
      emit(FeedState.loaded(questions));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint(e.toString());
      emit(FeedState.error(e.toString()));
    }
  }
}
