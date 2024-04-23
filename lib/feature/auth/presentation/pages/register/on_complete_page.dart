import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnCompletePage extends StatelessWidget {
  const OnCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delayed navigation function
    void navigateToNextPage() {
      Navigator.pushReplacementNamed(context, '/');
    }

    // Schedule navigation after 3 seconds
    Timer(Duration(seconds: 3), navigateToNextPage);

    return Scaffold(
      backgroundColor: Colors.blue, // Change this to your desired background color
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 110.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Done",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Thanks for giving us your precious time. Now you are ready for an enjoyable moment.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 60.h),
            Center(
              child: Image.asset(
                "assets/images/alldone.png",
                width: 233.w,
                height: 233.h,
              ),
            ),
            Spacer(),
            Center(
              child: Material(
                borderRadius: BorderRadius.circular(15),
                elevation: 5,
                color: Colors.green, // Change this to your desired button color
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    navigateToNextPage(); // Navigate immediately on button tap
                  },
                  child: SizedBox(
                    height: 55.h,
                    width: 310.w,
                    child: Center(
                      child: Text(
                        "Let's go!",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
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