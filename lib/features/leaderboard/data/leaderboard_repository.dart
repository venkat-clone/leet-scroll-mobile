import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'leaderboard_model.dart';

abstract class ILeaderboardRepository {
  Future<List<LeaderboardEntry>> getLeaderboard();
}

@LazySingleton(as: ILeaderboardRepository)
class LeaderboardRepository implements ILeaderboardRepository {
  final Dio _dio;

  LeaderboardRepository(this._dio);

  @override
  Future<List<LeaderboardEntry>> getLeaderboard() async {
    try {
      final response = await _dio.get("/leaderboard");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => LeaderboardEntry.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load leaderboard');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
