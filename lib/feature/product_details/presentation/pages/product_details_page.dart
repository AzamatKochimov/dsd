import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c202020,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              //write share logic here
            },
            icon: SvgPicture.asset('assets/icons/share-w.svg',
                width: 30, height: 30),
          ),
          IconButton(
            onPressed: () {
              //write add to cart logic here
            },
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset('assets/icons/cart-w.svg',
                  width: 28, height: 28),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.7.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Product image
              SizedBox(
                width: 318.w,
                child: Image.asset(
                  'assets/images/horse.png',
                  fit: BoxFit.fill,
                ),
              ),
        
              /// Product name
              const Text(
                "Horse",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ),
              SizedBox(height: 6.h),
        
              /// Product price
              const Text(
                "\$ 3 000",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white),
              ),
              SizedBox(height: 6.h),
        
              /// Payment installments
              const Row(
                children: [
                  Text(
                    "Pay in installments",
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    CupertinoIcons.checkmark,
                    color: Colors.greenAccent,
                    size: 13,
                  ),
                  Icon(
                    CupertinoIcons.xmark,
                    color: Colors.red,
                    size: 13,
                  ),
                ],
              ),
              SizedBox(height: 6.h),
        
              /// Product description
              const Text(
                "The helmet is a crucial piece of protective gear worn on the head to safeguard against injuries during various activities, such as sports, construction work, or military operations.",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 312.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.c57C5B6),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text('Add to Basket',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'condition: ',
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                  const Text(
                    'new',
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.c33FF00,
                    ),
                  ),
                  const Text(
                    '\\used',
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'availability: ',
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                  const Text(
                    'only via order',
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'delivery: ',
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.white.withOpacity(0.5),
                    ),
                  ),
                  const Text(
                    'only by BTS Post',
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'salesman:',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white.withOpacity(0.5),
                        ),
                      ),
                      const Text(
                        'Aleksey Alekseyevich:',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'Uzbekistan, Samarkand ',
                        style: TextStyle(
                          fontSize: 8,
                          color: AppColors.white.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '18.02.2024',
                        style: TextStyle(
                          fontSize: 8,
                          color: AppColors.white.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '3:15 pm',
                        style: TextStyle(
                          fontSize: 8,
                          color: AppColors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/images/profile-default.svg', width: 34.w, height: 34.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
