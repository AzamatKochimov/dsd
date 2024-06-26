import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/home/presentation/widgets/home_widget.dart';
import 'package:dsd/feature/home/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Consumer(
        builder: (context, ref, child) {
          ref.watch(homeref).getProductsForHome();
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45.h),

                  /// search bar and notifications
                  Row(
                    children: [
                      const HomePageSearchBar(),
                      const Spacer(),
                      Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/kolokolchik.svg',
                            height: 24,
                            width: 24,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: const Color(0xff33FF00),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF0eff00)
                                          .withOpacity(1),
                                      offset: const Offset(0, 0),
                                      blurRadius: 18,
                                      spreadRadius: 8,
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),

                  /// Choose region part
                  const Row(
                    children: [
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            "Where to look?",
                            style: TextStyle(color: Colors.white),
                          ),
                          AllRegionsDropDown(),
                        ],
                      )
                    ],
                  ),

                  /// Categories
                  const Text(
                    "Find what?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 270.h, child: const CategoriesWidget()),
                  Image.asset(
                    'assets/images/sale.png',
                    height: 150,
                    width: double.infinity,
                  ),

                  /// products
                  const ProductGenerator(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
