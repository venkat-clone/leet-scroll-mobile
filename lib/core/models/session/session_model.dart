import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/auth/data/user_model.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@unfreezed
class SessionModel with _$SessionModel {
  factory SessionModel({required UserModel user, required String expires}) =
      _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);
}
