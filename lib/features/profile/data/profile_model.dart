import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/profile/data/models/preferences/user_preferences_model.dart';
import 'package:mobile/features/profile/data/models/stats/profile_stats_model.dart';
import '../../auth/data/user_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required UserModel user,
    required ProfileStatsModel stats,
    required UserPreferencesModel preferences,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
