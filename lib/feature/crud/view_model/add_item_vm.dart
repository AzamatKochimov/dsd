import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageIndexProvider = StateProvider<int>((ref) => 0);

var createref = ChangeNotifierProvider.autoDispose<CreateNotifier>(
    (ref) => CreateNotifier());

class CreateNotifier extends ChangeNotifier {
  bool isNew = true;
  var numberCodes = ["USD", "UZS", "EUR", "KZT"];
  String dropdownvalue = "USD";
  void swapDropdownValue(String? newValue) {
    dropdownvalue = newValue!;
    notifyListeners();
  }

  void toUsed(){
    if(isNew){
      isNew = false;
    }
    notifyListeners();
  }

  void toNew(){
    if(isNew == false){
      isNew = true;
    }
    notifyListeners();
  }

  var items = [
      'English',
      'Uzbek',
      'Russian',
      'Kyrgyzstan',
      'Kazakh',
      'Tajik'
    ];

    String region = 'English';
}
final currentTabBarPageIndexCrudProvider = StateProvider<int>((ref) => 0);


