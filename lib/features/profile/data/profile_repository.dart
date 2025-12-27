import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/profile/data/models/preferences/user_preferences_model.dart';
import 'package:mobile/features/profile/data/models/submissions/submission_model.dart';
import 'profile_model.dart';

abstract class IProfileRepository {
  Future<ProfileModel> getProfile();
  Future<List<String>> getTags({String? search, int? pageLength, int? page});
  Future<void> updatePreferences(UserPreferencesModel preferences);
  Future<List<SubmissionModel>> getSubmissions({
    String? search,
    int? pageLength,
    int? page,
    String? filter,
  });
}

@LazySingleton(as: IProfileRepository)
class ProfileRepository implements IProfileRepository {
  final Dio _dio;

  ProfileRepository(this._dio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await _dio.get('/mobile/profile');

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load profile');
      }
    } on DioException catch (e, s) {
      debugPrint(e.message);
      debugPrintStack(stackTrace: s);
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<String>> getTags({
    String? search,
    int? pageLength,
    int? page,
  }) async {
    try {
      final response = await _dio.get(
        '/tags',
        queryParameters: {
          'search': search,
          'pageLength': pageLength,
          'page': page,
        },
      );
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      } else {
        throw Exception('Failed to load tags');
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> updatePreferences(UserPreferencesModel preferences) async {
    try {
      await _dio.post('/preferences', data: preferences.toJson());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<SubmissionModel>> getSubmissions({
    String? search,
    int? pageLength,
    int? page,
    String? filter,
  }) async {
    final filterKeys = {
      "SOLVED": 'solved',
      "ATTEMPTED": 'unsolved',
      "SKIPPED": 'skipped',
    };

    final result = await _dio.get(
      "/history",
      queryParameters: {
        'search': search,
        'pageLength': pageLength,
        'page': page,
        'filter': filterKeys[filter],
      },
    );
    if (result.statusCode == 200) {
      return List<SubmissionModel>.from(
        result.data['submissions'].map((x) => SubmissionModel.fromJson(x)),
      );
    } else {
      throw Exception("Failed to load submissions");
    }
  }
}
