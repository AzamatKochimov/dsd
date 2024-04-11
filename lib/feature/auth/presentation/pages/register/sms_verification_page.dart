import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

class SMSVerificationPage extends ConsumerStatefulWidget {
  const SMSVerificationPage({super.key});

  @override
  ConsumerState<SMSVerificationPage> createState() => _SMSVerificationPageState();
}

class _SMSVerificationPageState extends ConsumerState<SMSVerificationPage> {
  @override
  Widget build(BuildContext context) {
        const focusedBorderColor = Color.fromRGBO(255, 255, 255, 1);
    const fillColor = AppColors.greenishblue;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 24,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      decoration: BoxDecoration(
        color: AppColors.backround,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.greenishblue, width: 2),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backround,
      appBar: AppBar(
      backgroundColor: AppColors.backround,
        leading: GestureDetector(
            child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 64),
          child: Column(
            children: [
              const SizedBox(height: 15,),
              const Text("Enter the code received in SMS", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),),
              const SizedBox(height: 10,),
              const Text("An SMS with a confirmation code will be sent to the number +99890 990 01 10 within 57 seconds", style: TextStyle(color: Colors.grey),),
              const SizedBox(height: 60,),
              Pinput(inputFormatters: [FilteringTextInputFormatter.digitsOnly,],
                focusNode: FocusNode(),
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                separatorBuilder: (index) => const SizedBox(width: 20),
                validator: (value) {
                  return value == '2222'
                      ? null
                      : 'Incorrect code. Please try again.';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Send again after", style: TextStyle(color: Colors.white),), Text(" (time left)", style: TextStyle(color: Colors.white))],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
