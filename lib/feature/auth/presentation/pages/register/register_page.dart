import 'package:dsd/common/router/route_name.dart';
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
  bool isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backround,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.backround,
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
                  ...customTextfield(firstnameController, "First name"),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(lastnameController, "Last name"),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(phoneController, "Phone number", color: isNumberValid ? Colors.white : Colors.red),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(emailController, "Email address", color: isEmailValid ? Colors.white : Colors.red),
                  const SizedBox(
                    height: 10,
                  ),
                  ...customTextfield(passwordController, "Password"),
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
                        color: AppColors.greenishblue,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            if (validatePhoneNumber(phoneController.text) && validateEmail(emailController.text)) {
                              reff.getSms(emailController.text);
                              reff.phoneNumber = phoneController.text;
                              reff.email = emailController.text;
                              reff.password = passwordController.text;
                              reff.firstName = firstnameController.text;
                              reff.lastName = lastnameController.text;
                              isEmailValid = true;
                              isNumberValid = true;
                              setState(() {
                                
                              });
                              Navigator.pushNamed(
                                  context, AppRouteName.SMS_VERIFICATION_PAGE);
                            } else{
                              isNumberValid = validatePhoneNumber(phoneController.text);
                              isEmailValid = validateEmail(emailController.text);
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
                    height: 10,
                  ),
                  Center(child: Image.asset('assets/images/or.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        elevation: 5,
                        color: const Color.fromARGB(120, 255, 255, 255),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {},
                          child: SizedBox(
                            height: 55,
                            width: 310,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/google.png'),
                                  const SizedBox(width: 20),
                                  const Text(
                                    "Register with Google",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       border: Border.all(
                  //         color: Colors.white,
                  //         width: 2,
                  //       ),
                  //     ),
                  //     child: Material(
                  //       borderRadius: BorderRadius.circular(15),
                  //       elevation: 5,
                  //       color: const Color.fromARGB(120, 255, 255, 255),
                  //       child: InkWell(
                  //         borderRadius: BorderRadius.circular(15),
                  //         onTap: () {
                  //           Navigator.pushNamed(
                  //               context, AppRouteName.REGISTER_PAGE);
                  //         },
                  //         child: con st SizedBox(
                  //           height: 55,
                  //           width: 310,
                  //           child: Center(
                  //             child: Text(
                  //               "Create an account",
                  //               style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w700,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ));
  }
}

bool validatePhoneNumber(String phoneNumber) {
  // Remove any non-numeric characters from the phone number
  String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

  // Define regular expressions for valid phone number patterns
  Map<String, String> countryPatterns = {
    'UZ': r'^(998)?[35789]\d{8}$', // Uzbekistan (+998)
    'KZ': r'^(7)?[7-8]\d{9}$', // Kazakhstan (+7)
    'KG': r'^(996)?[567]\d{8}$', // Kyrgyzstan (+996)
    'TJ': r'^(992)?[5-9]\d{8}$', // Tajikistan (+992)
    'RU': r'^(7)?[3489]\d{9}$', // Russia (+7)
  };

  // Check against each country's pattern
  for (String countryCode in countryPatterns.keys) {
    String pattern = countryPatterns[countryCode]!;
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(cleanedNumber)) {
      // Valid phone number for the specified country
      print('Valid $countryCode phone number: $phoneNumber');
      return true;
    }
  }

  // If no patterns match, consider it invalid
  print('Invalid phone number: $phoneNumber');
  return false;
}

bool validateEmail(String email) {
  // Regular expression pattern for validating email addresses
  // This pattern allows for basic email validation but may not cover all edge cases
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Check if the email matches the regex pattern
  return emailRegex.hasMatch(email);
}
