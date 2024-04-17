import 'package:dio/dio.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/extra_later_will_be_deleted/model.dart';

// https://661d3026e7b95ad7fa6c7527.mockapi.io/categories

class GetCategoriesService {
  static BaseOptions _options = BaseOptions();
  static Dio _dio = Dio();
  static const Duration connectionTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const String baseUrl = "https://661d3026e7b95ad7fa6c7527.mockapi.io";
  static const String apiGetAllData = "/categories";
  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  static Dio init() {
    _options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      responseType: ResponseType.json,
      validateStatus: (statusCode) => statusCode! <= 205,
    );
    _dio = Dio(_options);
    return _dio;
  }

  static Future<List<CategoryModel>> fetchAllExam(String api) async {
    try {
      final response = await init().get(api);
      if (response.statusCode == 200) {
        // List<ExamModel> exams = examModelFromJson(response.data);
        // return exams;
        List<CategoryModel> exams = (response.data as List)
            .map((examJson) =>
            CategoryModel.fromJson(examJson as Map<String, dynamic>))
            .toList();
        return exams;
      } else {
        throw Exception('Failed to load Exams');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
  }
}