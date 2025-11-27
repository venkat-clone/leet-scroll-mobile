import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'profile_model.dart';

abstract class IProfileRepository {
  Future<ProfileModel> getProfile();
}

@LazySingleton(as: IProfileRepository)
class ProfileRepository implements IProfileRepository {
  final Dio _dio;

  ProfileRepository(this._dio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await _dio.get('/profile');

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load profile');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
