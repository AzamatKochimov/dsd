import 'dart:convert';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:dsd/common/server/api/api.dart';
import 'package:dsd/feature/crud/models/category_model.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/extra_later_will_be_deleted/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:l/l.dart';

import '../models/image_model.dart';

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

  // static Future<List<Categories>> fetchAllData(String api) async {
  //   try {
  //     final response = await init().get(api);
  //
  //     // List<ExamModel> exams = examModelFromJson(response.data);
  //     // return exams;
  //
  //     // List<CategoryModel> exams = (response.data as List)
  //     //     .map((examJson) =>
  //     //         CategoryModel.fromJson(examJson as Map<String, dynamic>))
  //     //     .toList();
  //     if(response.data != null && response.statusCode == 200 && response.data[response.data] != null) {
  //       var responseData = response.data['data'] as List;
  //       List<Categories> model =
  //       responseData.map((e) => Categories.fromJson(e)).toList();
  //       l.w("$responseData / $response");
  //
  //       return model;
  //     }else{
  //       throw Exception("$response");
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load data $e');
  //   }
  // }

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
        l.i("${response.data}");
        return "Image uploaded successfully";
      } else {
        l.e("${response.statusCode}");
        return "Failed to upload image: ${response.statusCode}";
      }
    } on DioError catch (e) {
      return "DioError: ${e.response?.data['message'] ?? e.message}";
    } catch (e) {
      return "Error: $e";
    }
  }

  static Future<String> addProduct(String api, String sendData)async{
    Response response = await init().post(api, data: sendData);
   try{
     if(response.statusCode == 200){
       l.i(response.data);
        return "added succesfully";
     }else{
       l.e(response.data);
       return "${response.statusCode}";
     }
   }
   catch(e){
     return "Error: $e";
   }
  }
}
