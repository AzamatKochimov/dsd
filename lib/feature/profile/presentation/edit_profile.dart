import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String selectedRegion = 'Default Region';
  List<String> regions = [
    'Region 1',
    'Region 2',
    'Region 3',
    'Region 4'
  ];
  TextEditingController searchController = TextEditingController();
  bool showSearchBar = false;
  
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Edit profile',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 116.w),
              child: Center(
                child: CircleAvatar(
                  radius: 40.w,
                  foregroundImage: const AssetImage('assets/images/avatar.png'),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Your ID: 024875447 ',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0.14,
              ),
            ),
            SizedBox(height: 15.h),
            const Text(
              'Your name on ***',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0.14,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 312.w,
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Marsev',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.42,
                    ),
                  ),
                  Icon(Icons.check, color: AppColors.c33FF00, weight: 10),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            const SizedBox(
              width: 66,
              child: Opacity(
                opacity: 0.50,
                child: Text(
                  'Regions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.17,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Republics',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.17,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(
                      width: 122.w,
                      height: 20.h,
                      child: showSearchBar
                          ? TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: AppColors.c313131,
                                hintText: 'Search Region',
                                hintStyle: TextStyle(color: Colors.white)
                              ),
                              onChanged: (value) {
                                // Implement search functionality here
                              },
                            )
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  showSearchBar = true;
                                });
                              },
                              child: Text(selectedRegion),
                            ),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Republics',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: 10.0.h,
          left: 24.w,
          right: 24.w,
        ),
        child: ElevatedButton(
          onPressed: () {},
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
            child: const Center(
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 0.16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate {
  const CustomSearchDelegate();
}
