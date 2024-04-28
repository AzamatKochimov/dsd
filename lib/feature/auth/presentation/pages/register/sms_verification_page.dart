import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/data/entities/user.dart';
import 'package:dsd/feature/auth/view_model/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class SMSVerificationPage extends ConsumerStatefulWidget {
  const SMSVerificationPage({super.key});

  @override
  ConsumerState<SMSVerificationPage> createState() =>
      _SMSVerificationPageState();
}

class _SMSVerificationPageState extends ConsumerState<SMSVerificationPage> {
  late Duration _countdownDuration;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    // Set the countdown duration to 3 minutes
    _countdownDuration = const Duration(minutes: 3);
    // Start the countdown timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _countdownDuration -= const Duration(seconds: 1);
        if (_countdownDuration <= Duration.zero) {
          // Handle timeout by navigating back to the previous page
          Navigator.pop(context);
          _timer.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(255, 255, 255, 1);
    const fillColor = AppColors.greenishBlue;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.greenishBlue, width: 2),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: GestureDetector(
            child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        )),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var reff = ref.watch(loginref);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 64),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Enter the code received in SMS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "An SMS with a confirmation code will be sent to the number ${reff.phoneNumber} within ${_formatDuration(_countdownDuration)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Pinput(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    focusNode: FocusNode(),
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    separatorBuilder: (index) => const SizedBox(width: 20),
                    // validator: (value) {},
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) async {
                      log('onCompleted: $pin');
                      Map<String, dynamic> mapp = {
                        "phoneNumber": reff.phoneNumber,
                        "email": reff.email,
                        "password": reff.password,
                        "firstName": reff.firstName,
                        "lastName": reff.lastName,
                        "code": int.parse(pin),
                      };

                      log(jsonEncode(mapp));
                      // reff.register(mapp);
                      var result = await reff.register(mapp);
                          log("result:");
                          log(jsonEncode(result));
                          if (result['status'] == true) {
                            // Login successful
                            var data = result['userDto'];
                            reff.currentUser = User(phoneNumber: data['phoneNumber'], email: data['email'], firstName: data['firstName'], lastName: data['lastName'], id: data['id'], photo_url: data['attachment']);
                            log("heres the current user ${reff.currentUser.toString()}");
                            print(reff.currentUser.toString());
                            // print(result);
                            // print(result['userDto']);
                            Navigator.pushNamed(context, AppRouteName.ON_COMPLETE_PAGE);
                            log("register successful");
                          } else {
                            // Login failed
                            log("Register not successful");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Register failed. Please try again.'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                    },
                    // onChanged: (value) {
                    //   pinCode.state = value;
                    //   debugPrint('onChanged: $value');
                    // },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
