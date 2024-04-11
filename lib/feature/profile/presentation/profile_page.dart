import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c202020,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, AppRouteName.PROFILE_SETTINGS);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Text('Change Settings',
                  style: TextStyle(
                    color: AppColors.white,
                  )),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Center(
              child: CircleAvatar(
                radius: 60,
                foregroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
            Container(
              width: double.infinity,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Marsdev',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'sevinchmardonova@gmail.com',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'ID: 024875447',
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Personal Details',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.c57C5B6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: SizedBox(
                width: 312.w,
                height: 58.h,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/profile-w.svg'),
                    const SizedBox(width: 10),
                    const Text(
                      'Marsdev',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.42,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.c57C5B6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: SizedBox(
                width: 312.w,
                height: 58.h,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/sms-w.svg'),
                    const SizedBox(width: 10),
                    const Text(
                      'sevinchmardonova@gmail.com',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.42,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.c57C5B6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.white.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: SizedBox(
                width: 312.w,
                height: 58.h,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/call-w.svg'),
                    const SizedBox(width:10),
                    const Text(
                      '+998 93 999 99 99',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: 0.42,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
