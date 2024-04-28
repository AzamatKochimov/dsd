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
}
