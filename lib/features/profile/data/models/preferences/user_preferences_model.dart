import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences_model.freezed.dart';

part 'user_preferences_model.g.dart';

@unfreezed
class UserPreferencesModel with _$UserPreferencesModel {
  factory UserPreferencesModel({
    required String id,
    required String userId,
    required List<String> preferredDifficulties,
    required List<String> preferredTopics,
    required List<String> interestedTopics,
    required int feedSize,
    required List<String> preferredLanguages,
  }) = _UserPreferencesModel;

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesModelFromJson(json);
}
