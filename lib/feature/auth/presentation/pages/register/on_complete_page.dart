import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnCompletePage extends StatelessWidget {
  const OnCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backround,
      body: Container(
        padding:
            EdgeInsets.only(top: 110.h, left: 24.w, right: 24.w, bottom: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Done",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Thanks for giving us your precious time. Now you are ready for an enjoyable moment.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Image.asset(
                "assets/images/alldone.png",
                width: 233,
                height: 233,
              ),
            ),
            const Spacer(),
            Center(
              child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 5,
                color: AppColors.greenishblue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {},
                  child: SizedBox(
                    height: 55,
                    width: 310.w,
                    child: const Center(
                      child: Text(
                        "Let's go!",
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
          ],
        ),
      ),
    );
  }
}
