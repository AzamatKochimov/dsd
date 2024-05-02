import 'dart:convert';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:dsd/common/server/api/api.dart';
import 'package:dsd/feature/auth/view_model/auth_vm.dart';
import 'package:dsd/feature/crud/models/category_model.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/extra_later_will_be_deleted/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:l/l.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/image_model.dart';

// https://dominant-soft-development.up.railway.app/category/list

// https://dominant-soft-development.up.railway.app/category/list

class GetCategoriesService {
  GetCategoriesService._();

  static BaseOptions _options = BaseOptions();
  static Dio _dio = Dio();

  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const String baseUrl =
      "https://dominant-soft-development.up.railway.app";

  // apies
  static const String apiGetAllCategoryList = "/category/list";
  static const String apiUploadImageAttachment = "/attachment/upload";
  static const String apiAddNewProductAPI = "/product";

  // headers
  // static Map<String, String> headers = {
  //   "Content-Type": "application/json",
  //   "Authorization": "Bearer ${AuthManager.getToken()}"
  // };

  // header get
  static Future<Map<String, String>> getHeaders({bool isUpload = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final headers = <String, String>{
      'Content-type':
          isUpload ? 'multipart/form-data' : 'application/json; charset=UTF-8',
      'Accept':
          isUpload ? 'multipart/form-data' : 'application/json; charset=UTF-8',
    };

    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty) {
      headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    return headers;
  }

  static Future<Dio> init() async {
    _options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      headers: await GetCategoriesService.getHeaders(),
      responseType: ResponseType.json,
      validateStatus: (statusCode) => statusCode! <= 205,
    );
    _dio = Dio(_options);
    return _dio;
  }

  static Future<List<Categories>> fetchAllData(String api) async {
    try {
      final response = await (await init()).get(api);
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

  static Future<int> uploadImage(String api, XFile imageFile) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path,
          filename: imageFile.name),
    });

    // try {
    // Perform a POST request to upload the image
    Response response = await (await init()).post(api, data: formData);
    l.i("Rasm uploaded succesfully ${response.data}");
    if (response.statusCode == 200) {
      ImageModel imageResponse = ImageModel.fromJson(response.data);
      if (imageResponse.success && imageResponse.images.id != null) {
        l.i('${imageResponse.images.id} si olindi succes');
        return imageResponse.images.id!;
      } else {
        l.e('Image id is not found');
        throw Exception('The Image id is not found');
      }
      // int? imageId = response.data['id'];
      // if (imageId != null) {
      //   l.i("The ID of Image get succesfully $imageId");
      //   return imageId;
      // } else {
      //   l.e("Image id is not get $imageId");
      //   throw Exception('Image id is not get');
      // }
    } else {
      l.e("Failed to upload Image ${response.statusCode}");
      throw Exception('Failed to Upload Image');
    }
    // } on DioError catch (e) {
    //   return "DioError: ${e.response?.data['message'] ?? e.message}";
    // } catch (e) {
    //   return "Error: $e";
    // }
  }

  static Future<String> createProduct(String api, String sendData) async {
    try {
      Response response = await (await init()).post(api, data: sendData);
      if (response.statusCode == 200) {
        l.i("added successfully : ${response.data}");
        return "added successfully";
      } else {
        l.e("Failed with status code: ${response.statusCode}");
        l.e("Response data: ${response.data}");
        return "Error: status code ${response.statusCode}";
      }
    } catch (e) {
      l.e("Exception caught: $e");
      return "Exception: $e";
    }
  }
}
