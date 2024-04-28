import 'package:dio/dio.dart';
import 'package:dsd/feature/crud/models/category_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:l/l.dart';

// https://dominant-soft-development.up.railway.app/category/list

// https://dominant-soft-development.up.railway.app/category/list

class GetCategoriesService {
  static BaseOptions _options = BaseOptions();
  static Dio _dio = Dio();
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const String baseUrl =
      "https://dominant-soft-development.up.railway.app";

  // apies
  static const String apiGetAllCategoryList = "/category/list";
  static const String apiUploadImageAttachment = "/attachment/upload";

  // headers
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

  static Future<List<Categories>> fetchAllData(String api) async {
    try {
      final response = await init().get(api);
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data['data'];
        List<Categories> categories = [];
        for (var i = 0; i < responseData.length; i++) {
          try {
            categories.add(
                Categories.fromJson(responseData[i] as Map<String, dynamic>));
          } catch (e) {
            l.w('Error parsing category at index $i: $e');
            continue;
          }
        }
        return categories;
      } else {
        l.e('Failed to fetch categories. Status code: ${response.statusCode}');
        throw Exception(
            "Failed to fetch categories. Status code: ${response.statusCode}");
      }
    } catch (e) {
      l.e('Failed to load data: $e');
      throw Exception('Failed to load data: $e');
    }
  }

  static Future<String> uploadImage(String api, XFile imageFile) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path,
          filename: imageFile.name),
    });

    try {
      // Perform a POST request to upload the image
      Response response = await init().post(api, data: formData);
      if (response.statusCode == 200) {
        return "Image uploaded successfully";
      } else {
        return "Failed to upload image: ${response.statusCode}";
      }
    } on DioException catch (e) {
      return "DioError: ${e.response?.data['message'] ?? e.message}";
    } catch (e) {
      return "Error: $e";
    }
  }
}
