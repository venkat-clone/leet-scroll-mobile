import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'question_model.dart';

abstract class IFeedRepository {
  Future<List<Question>> getQuestions({int page = 1, int limit = 10});
  Future<Map<String, dynamic>> toggleLike(String questionId);
  Future<Map<String, dynamic>> getLikeStatus(String questionId);
  Future<List<dynamic>> getComments(String questionId);
  Future<Map<String, dynamic>> postComment(String questionId, String content);
  Future<Map<String, dynamic>> submitAnswer(String questionId, int selectedOption);
  Future<Map<String, dynamic>> toggleBookmark(String questionId);
  Future<Map<String, dynamic>> getBookmarkStatus(String questionId);
  Future<void> reportQuestion(String questionId, String reason);
}

@LazySingleton(as: IFeedRepository)
class FeedRepository implements IFeedRepository {
  final Dio _dio;

  FeedRepository(this._dio);

  @override
  Future<List<Question>> getQuestions({int page = 1, int limit = 10}) async {
    try {
      final response = await _dio.get(
        '/questions',
        queryParameters: {'page': page, 'limit': limit},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> questionsJson = data['questions'];
        return questionsJson.map((json) => Question.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load questions');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> toggleLike(String questionId) async {
    try {
      final response = await _dio.post(
        '/questions/$questionId/like',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to toggle like');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getLikeStatus(String questionId) async {
    try {
      final response = await _dio.get(
        '/questions/$questionId/like',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to get like status');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<dynamic>> getComments(String questionId) async {
    try {
      final response = await _dio.get(
        '/questions/$questionId/comments',
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load comments');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> postComment(String questionId, String content) async {
    try {
      final response = await _dio.post(
        '/questions/$questionId/comments',
        data: {'content': content},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to post comment');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> submitAnswer(String questionId, int selectedOption) async {
    try {
      final response = await _dio.post(
        '/submit',
        data: {
          'questionId': questionId,
          'selectedOption': selectedOption,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to submit answer');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['error'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> toggleBookmark(String questionId) async {
    try {
      // TODO: Replace with actual endpoint when available
      // Simulating network delay
      await Future.delayed(const Duration(milliseconds: 500));
      return {'success': true};
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getBookmarkStatus(String questionId) async {
    try {
      // TODO: Replace with actual endpoint when available
      // Simulating network delay
      await Future.delayed(const Duration(milliseconds: 200));
      return {'isBookmarked': false};
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> reportQuestion(String questionId, String reason) async {
    try {
      // TODO: Replace with actual endpoint when available
      // Simulating network delay
      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
