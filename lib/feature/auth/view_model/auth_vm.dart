
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var loginref =
    ChangeNotifierProvider.autoDispose<LoginNotifier>((ref) => LoginNotifier());

class LoginNotifier extends ChangeNotifier {
  bool isEmail = true;
  bool isObscure = true;
  bool isChecked = false;

  var numberCodes = [
    "+998", /// Uzbekistan
    "+7",   /// Kazakhstan
    "+996", /// Kyrgyzstan
    "+992", /// Tajikistan
    "+993", /// Turkmenistan
    "+93",  /// Afghanistan
  ];

  String dropdownvalue = "+998";

  void swapEmail(){
    isEmail = !isEmail;
    notifyListeners();
  }

  void swapObscure(){
    isObscure = !isObscure;
    notifyListeners();
  }

  void swapChecked(){
    isChecked = !isChecked;
    notifyListeners();
  }

  void swapDropdownValue(String? newValue){
    dropdownvalue = newValue!;
    notifyListeners();
  }
}
