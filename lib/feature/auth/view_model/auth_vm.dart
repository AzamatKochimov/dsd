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
    Map<String, dynamic> result;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response =
          await ApiService.post("api/auth/register", map, params: {});

      Map<String, dynamic> responseObj = jsonDecode(response!);

      if (responseObj['success'] = true) {
        // User user = User.fromJson(json.decode(response.body));
        prefs.setString("token", responseObj['data']['accessToken']);
        log("THIS IS TOKEN!!!!");
        log(prefs.getString('token')!);
        result = {
          'status': true,
          'message': 'Successfully registered.',
          // 'data': user
        };
      } else {
        // String message = '${json.decode(response.body)['message']}.';
        result = {
          'status': false,
          'message': 'Register failed.',
          // 'data': message
        };
      }
    } catch (error) {
      log("Error: $error");
      result = {
        'status': false,
        'message': 'Unsuccessful request.',
        'data': 'An error occurred during the request.'
      };
    }
    return result;
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> map) async {
    Map<String, dynamic> result;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var response =
          await ApiService.post("api/auth/login", map, params: {});

      Map<String, dynamic> responseObj = jsonDecode(response!);

      if (responseObj['success'] = true) {
        // User user = User.fromJson(json.decode(response.body));
        prefs.setString("token", responseObj['data']['accessToken']);
        log("THIS IS NEW TOKEN!!!");
        log(prefs.getString('token')!);
        result = {
          'status': true,
          'message': 'Successfully registered.',
          // 'data': user
        };
      } else {
        // String message = '${json.decode(response.body)['message']}.';
        result = {
          'status': false,
          'message': 'Register failed.',
          // 'data': message
        };
      }
    } catch (error) {
      log("Error: $error");
      result = {
        'status': false,
        'message': 'Unsuccessful request.',
        'data': 'An error occurred during the request.'
      };
    }
    return result;
  }
}
