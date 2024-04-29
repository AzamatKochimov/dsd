import 'dart:convert';
import 'dart:developer';

import 'package:dsd/common/server/api/api.dart';
import 'package:dsd/common/server/api/api_constants.dart';
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

  List<dynamic>? productsForHome;

  Future<bool> getProductsForHome() async {
    log("getting products");
    String? response = await ApiService.get(ApiConst.getAllProduct, {});
    print(response);
    Map<String, dynamic> responseObj = jsonDecode(response!);
    if (responseObj['data'] != null) {
      productsForHome = responseObj['data'];
      return true;
    } else {
      return false;
    }
  }
}
