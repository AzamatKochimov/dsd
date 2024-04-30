import 'package:dsd/common/router/route_name.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // This code will run after the first frame is displayed
      ref.read(homeref).getProductsForHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Consumer(
        builder: (context, ref, child) {
          var reff = ref.watch(homeref);
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

                  reff.productsForHome != null
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: reff.productsForHome?.length ??
                              0, // Ensure products is not null
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200.w,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 8.0,
                            mainAxisExtent: 260.h,
                          ),
                          itemBuilder: (context, index) {
                            print("null null null");
                            if (reff.productsForHome != null &&
                                index <= reff.productsForHome!.length) {
                              Map<String, dynamic> currentProduct =
                                  reff.productsForHome![index];
                              // Assuming ProductListModel has a property data which holds a list of Datum
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRouteName.PRODUCT_DETAILS_PAGE,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff313131),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        height: 150,
                                        child:
                                            Image.network(
                                              "uploadIMG/2024/4/25/b2974d14-aed7-4b61-810c-047dea320f2a.jpg")
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              currentProduct["productName"],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "\$${currentProduct["price"]}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              truncateText(
                                                  currentProduct['description'],
                                                  40),
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              print(
                                  "Error: There are no products or the list is null");
                              return SizedBox(); // Return an empty SizedBox as a placeholder
                            }
                          },
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

String truncateText(String text, int maxLength) {
  if (text.length > maxLength) {
    return '${text.substring(0, maxLength)}...';
  } else {
    return text;
  }
}
