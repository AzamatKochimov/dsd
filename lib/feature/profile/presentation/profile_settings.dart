import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c202020,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 123.w),
            child: Center(
              child: CircleAvatar(
                radius: 57.w,
                foregroundImage: const AssetImage('assets/images/avatar.png'),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60.w,
                height: 22.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: AppColors.c57C5B6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'edit',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Container(
                width: 60.w,
                height: 22.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF57C5B6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'delete',
                  style: TextStyle(fontSize: 10, color: AppColors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteName.EDIT_PROFILE);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Edit profile',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: const Divider(color: AppColors.white),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: AppColors.c202020,
                    title: const Text(
                      'Changing phone number is not available yet',
                      style: TextStyle(color: AppColors.white),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change phone number',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: const Divider(color: AppColors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteName.CHANGE_EMAIL);
            },
            icon: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change email',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: const Divider(color: AppColors.white),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteName.NOTIFICATIONS);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: const Divider(color: AppColors.white),
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: AppColors.c202020,
                    title: const Text(
                      'Deleting is not available yet',
                      style: TextStyle(color: AppColors.white),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delete profile',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: const Divider(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
