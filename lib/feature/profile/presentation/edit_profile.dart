import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchfield/searchfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  var suggestions = <String>[];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.c202020,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                'Your name on DSD',
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
                width: 166,
                child: Opacity(
                  opacity: 0.50,
                  child: Text(
                    'Set your locations',
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
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Country',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.17,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        width: 147.w,
                        child: SearchField(
                          hint: 'Country',
                          controller: countryController,
                          initialValue: SearchFieldListItem<String>('Uzbekistan'),
                          suggestions: [
                            'Uzbekistan',
                            'Kazakhstan',
                            'Tajikistan',
                            'Turkmenistan',
                            'Kyrgyzstan'
                          ].map(SearchFieldListItem<String>.new).toList(),
                          suggestionState: Suggestion.expand,
                          suggestionDirection: SuggestionDirection.up,
                          searchInputDecoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 10.h),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: AppColors.c202020,
                            suffixIcon: const Icon(CupertinoIcons.forward, size: 16),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            suffixIconColor: AppColors.white,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Region',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.17,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        width: 147.w,
                        child: SearchField(
                          hint: 'City',
                          controller: cityController,
                          initialValue: SearchFieldListItem<String>('Tashkent'),
                          suggestions: [
                            'Tashkent',
                            'Andijon',
                            'Buxoro',
                            "Farg'ona",
                            'Jizzax',
                            'Xorazm',
                            'Namangan',
                            'Navoiy',
                            'Qashqadaryo',
                            'Samarqand',
                            'Sirdaryo',
                            'Surxondaryo'
                          ].map(SearchFieldListItem<String>.new).toList(),
                          suggestionState: Suggestion.expand,
                          suggestionDirection: SuggestionDirection.up,
                          searchInputDecoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: AppColors.c202020,
                            suffixIcon: const Icon(CupertinoIcons.forward, size: 16, opticalSize: 12,),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            suffixIconColor: AppColors.white,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
          onPressed: () {
            Navigator.pop(context);
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
