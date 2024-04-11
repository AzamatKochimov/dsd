import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var items = ['English', 'Uzbek', 'Russian', 'Kyrgyzstan', 'Kazakh', 'Tajik'];

  String dropdownvalue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 140.h,
            ),
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: 50.h,
            ),
            const Text('Welcome to (yor logo name)',
                style: TextStyle(
                    color: AppColors.greenishblue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 105.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              alignment: Alignment.topLeft,
              child: const Text(
              'Application language',
              style: TextStyle(color: AppColors.white, fontSize: 14),
            ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 55, right: 55),
              child: DropdownButton(
                isExpanded: true,
                style: const TextStyle(color: AppColors.white),
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: AppColors.backround,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 105.h,
            ),

            /// button
            Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 5,
              color: AppColors.greenishblue,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: const SizedBox(
                  height: 55,
                  width: 310,
                  child: Center(
                    child: Text(
                      "Next",
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

            /// button
          ],
        ),
      ),
    );
  }
}
