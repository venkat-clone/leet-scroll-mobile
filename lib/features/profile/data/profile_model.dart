import 'package:freezed_annotation/freezed_annotation.dart';
import '../../auth/data/user_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required UserModel user,
    required ProfileStats stats,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class ProfileStats with _$ProfileStats {
  const factory ProfileStats({
    @Default(0) int correctAnswers,
    @Default(0) int wrongAnswers,
    @Default(0) int questionsAttempted,
  }) = _ProfileStats;

  factory ProfileStats.fromJson(Map<String, dynamic> json) =>
      _$ProfileStatsFromJson(json);
}
