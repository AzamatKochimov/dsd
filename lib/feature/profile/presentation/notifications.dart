import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool massagesOn = false;
  bool announcementsOn = false;
  bool priceReductionOn = false;
  bool discountsOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c202020,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! New messages
            const Text(
              "Receive notifications of new messages",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            //! Button New Message
            Container(
              height: 48.h,
              width: 312.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "New messages",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.5,
                          child: Switch(
                            value: massagesOn,
                            activeColor: AppColors.c33FF00,
                            onChanged: (value) {
                              setState(() {
                                massagesOn = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            //! Notify abt New announcements
            const Text(
              "Receive notifications when new listings match your\nsaved searches",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            //! Button New announcements
            Container(
              height: 48.h,
              width: 312.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "New announcements",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.5,
                          child: Switch(
                            value: announcementsOn,
                            activeColor: AppColors.c33FF00,
                            onChanged: (value) {
                              setState(() {
                                announcementsOn = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            //! News abt likes
            const Text(
              "Notify about price reductions for ads from Favorites",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            //! Button price reduction
            Container(
              height: 48.h,
              width: 312.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Price reduction",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.5,
                          child: Switch(
                            value: priceReductionOn,
                            activeColor: AppColors.c33FF00,
                            onChanged: (value) {
                              setState(() {
                                priceReductionOn = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            //! Discounts text
            const Text(
              "Communicate personal discounts on adverts",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            //! Button discounts
            Container(
              height: 48.h,
              width: 312.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discounts",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.5,
                          child: Switch(
                            value: discountsOn,
                            activeColor: AppColors.c33FF00,
                            onChanged: (value) {
                              setState(() {
                                discountsOn = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
