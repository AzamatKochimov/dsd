import 'dart:developer';

import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/server/api/api.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/auth/presentation/widgets/register/register.dart';
import 'package:dsd/feature/auth/view_model/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isNumberValid = true;
  bool doesNumberExists = false;
  bool isEmailValid = true;
  bool doesEmailExists = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.background,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.background,
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          title: const Text("Registration",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        body: Consumer(
          builder: (context, ref, _) {
            ref.watch(loginref);
            var reff = ref.watch(loginref);
            return Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...customTextfield(firstnameController, "First name", inputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(lastnameController, "Last name", inputType: TextInputType.name),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(
                    inputType: TextInputType.phone,
                      phoneController,
                      doesNumberExists
                          ? "Phone number is already registered"
                          : "Phone number",
                      color: isNumberValid && !doesNumberExists ? Colors.white : Colors.red),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(
                    inputType: TextInputType.emailAddress,
                      emailController,
                      doesEmailExists
                          ? "Email is already registered"
                          : "Email Address",
                      color: isEmailValid && !doesEmailExists ? Colors.white : Colors.red),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(passwordController, "Password", inputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  const Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        elevation: 5,
                        color: AppColors.greenishBlue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () async {
                            bool aa = await a(phoneController.text);
                            bool bb = await b(emailController.text);
                            if (validatePhoneNumber(phoneController.text) &&
                                validateEmail(emailController.text) &&
                                !aa &&
                                !bb) {
                              reff.getSms(emailController.text);
                              reff.phoneNumber = phoneController.text;
                              reff.email = emailController.text;
                              reff.password = passwordController.text;
                              reff.firstName = firstnameController.text;
                              reff.lastName = lastnameController.text;
                              isEmailValid = true;
                              isNumberValid = true;
                              setState(() {});
                              Navigator.pushNamed(
                                  context, AppRouteName.SMS_VERIFICATION_PAGE);
                            } else {
                              isNumberValid =
                                  validatePhoneNumber(phoneController.text);
                              doesNumberExists = aa;
                              isEmailValid =
                                  validateEmail(emailController.text);
                              doesEmailExists = bb;
                              setState(() {});
                            }
                          },
                          child: SizedBox(
                            height: 55,
                            width: 310.w,
                            child: const Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            );
          },
        ));
  }
}

Future<bool> a(String phone) async {
  log("working");
  log(phone);
  String? responsePhone = await ApiService.get(
    "api/auth/exist-phone",
    {"phone": "$phone"},
  );
  log(responsePhone!);

  if (responsePhone == "true") {
    return true;
  } else {
    return false;
  }
}

Future<bool> b(String email) async {
  log(email);
  log("working");
  String? responseEmail =
      await ApiService.get("api/auth/exist-email", {"email": email});
  log(responseEmail!);

  if (responseEmail == "true") {
    return true;
  } else {
    return false;
  }
}

bool validatePhoneNumber(String phoneNumber) {
  String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

  Map<String, String> countryPatterns = {
    'UZ': r'^(998)?[35789]\d{8}$', // Uzbekistan (+998)
    'KZ': r'^(7)?[7-8]\d{9}$', // Kazakhstan (+7)
    'KG': r'^(996)?[567]\d{8}$', // Kyrgyzstan (+996)
    'TJ': r'^(992)?[5-9]\d{8}$', // Tajikistan (+992)
    'RU': r'^(7)?[3489]\d{9}$', // Russia (+7)
  };

  for (String countryCode in countryPatterns.keys) {
    String pattern = countryPatterns[countryCode]!;
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(cleanedNumber)) {
      print('Valid $countryCode phone number: $phoneNumber');
      return true;
    }
  }

  print('Invalid phone number: $phoneNumber');
  return false;
}

bool validateEmail(String email) {
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  return emailRegex.hasMatch(email);
}
