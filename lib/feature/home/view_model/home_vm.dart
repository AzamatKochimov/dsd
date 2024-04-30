import 'dart:convert';
import 'dart:developer';

import 'package:dsd/common/server/api/api.dart';
import 'package:dsd/common/server/api/api_constants.dart';
import 'package:dsd/data/entities/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var homeref =
    ChangeNotifierProvider.autoDispose<HomeNotifier>((ref) => HomeNotifier());

class HomeNotifier extends ChangeNotifier {
  var numberCodes = [
    "All Regions",
    "Uzbekistan",
    "Kazakhstan",
    "Kyrgyzstan",
    "Tajikistan",
    "Turkmenistan",
    "Afghanistan",
  ];
  String dropdownvalue = "All Regions";
  void swapDropdownValue(String? newValue) {
    dropdownvalue = newValue!;
    notifyListeners();
  }

  List<Map<String, dynamic>>? productsForHome;

  Future<bool> getProductsForHome() async {
    log("getting products");
    String? response = await ApiService.get(ApiConst.getAllProduct, {});
    Map<String, dynamic> responseObj = jsonDecode(response!);
    if (responseObj['data'] != null) {
      log("its not null");
      print(responseObj['data']);
      // Ensure responseObj['data'] is List<dynamic>
      if (responseObj['data'] is List<dynamic>) {
        productsForHome =
            (responseObj['data'] as List<dynamic>).map((dynamic item) {
          return Map<String, dynamic>.from(item);
        }).toList();
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

}
