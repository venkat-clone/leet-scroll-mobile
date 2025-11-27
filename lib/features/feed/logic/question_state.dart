import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_state.freezed.dart';

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState({
    @Default(0) int likesCount,
    @Default(false) bool isLiked,
    @Default(false) bool isLoadingLike,
    @Default([]) List<dynamic> comments,
    @Default(false) bool isLoadingComments,
    @Default(false) bool isPostingComment,
    @Default(false) bool isBookmarked,
    @Default(false) bool isLoadingBookmark,
    @Default(false) bool isReporting,
    @Default(false) bool isReported,
    String? error,
  }) = _QuestionState;
}
