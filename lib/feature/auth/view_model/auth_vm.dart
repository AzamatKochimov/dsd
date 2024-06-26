import 'dart:convert';
import 'dart:developer';

import 'package:dsd/common/server/api/api.dart';
import 'package:dsd/data/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loginref =
    ChangeNotifierProvider.autoDispose<LoginNotifier>((ref) => LoginNotifier());

class LoginNotifier extends ChangeNotifier {
  User? currentUser;

  bool isEmail = true;
  bool isObscure = true;
  bool isChecked = false;

  String? phoneNumber;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? code;

  var numberCodes = [
    "+998",

    /// Uzbekistan
    "+7",

    /// Kazakhstan
    "+996",

    /// Kyrgyzstan
    "+992",

    /// Tajikistan
    "+993",

    /// Turkmenistan
    "+93",

    /// Afghanistan
  ];

  String dropdownvalue = "+998";

  void swapEmail() {
    isEmail = !isEmail;
    notifyListeners();
  }

  void swapObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void swapChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }

  void swapDropdownValue(String? newValue) {
    dropdownvalue = newValue!;
    notifyListeners();
  }

  Future<String?> getSms(String email) async {
    log(email);
    String? response =
        await ApiService.post("api/auth/email", {}, params: {'email': email});
    log(response!);
    return response;
  }

  // Future<String?> getregistered(Map<String, dynamic> map) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   log("hey");
  //   String? response =
  //       await ApiService.post("api/auth/register", map, params: {});
  //   log(response!);
  //   return response;
  // }

  Future<Map<String, dynamic>> register(Map<String, dynamic> map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log("register check:");

    String? response =
        await ApiService.post("api/auth/register", map, params: {});

    log("register check:");
    print(response);
    Map<String, dynamic> responseObj = jsonDecode(response!);

    if (responseObj.containsKey('success') && responseObj['success'] == true) {
      // Login successful
      prefs.setString("token", responseObj['data']['accessToken']);
      print("correct"); // Print "correct" to console
      return {
        'status': true,
        'message': 'Successfully registered.',
        'userDto': responseObj['data']['userDTO']
      };
    } else {
      // Login failed
      print("password or number is wrong"); // Print error message to console
      return {
        'status': false,
        'message': 'Register failed. Please try again.',
      };
    }
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? response;
    log("login func begins");
    try {
      response = await ApiService.post("api/auth/login", map, params: {});
      log("aaaa ${response!}");
    } catch (e) {
      return {'status': false};
    }

    Map<String, dynamic> responseObj = jsonDecode(response);

    if (responseObj.containsKey('success') && responseObj['success'] == true) {
      // Login successful
      prefs.setString("token", responseObj['data']['accessToken']);
      print("correct"); // Print "correct" to console
      return {
        'status': true,
        'message': 'Successfully logged in.',
        'userDto': responseObj['data']['userDTO']
      };
    } else {
      // Login failed
      print("password or number is wrong"); // Print error message to console
      return {
        'status': false,
        'message': 'Login failed. Please try again.',
      };
    }
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null;
  }
}
