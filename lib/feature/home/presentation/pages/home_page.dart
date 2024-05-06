import 'dart:developer';

import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/data/entities/product_model_sardor.dart';
import 'package:dsd/feature/home/presentation/widgets/favorite_button.dart';
import 'package:dsd/feature/home/presentation/widgets/home_widget.dart';
import 'package:dsd/feature/home/view_model/home_vm.dart';
import 'package:dsd/feature/likes/view_model/likes_vm.dart';
import 'package:dsd/feature/product_details/presentation/pages/product_details_page.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
          return reff.productsForHome != null
              ? SingleChildScrollView(
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
                        SizedBox(
                            height: 270.h, child: const CategoriesWidget()),
                        // const SizedBox(height: 20,),
                        const SizedBox(height: 30,),
                        Container(
                            height: 150,
                            width: double.infinity,
                          child: Image.asset(
                            'assets/images/sale.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        // const SizedBox(height: 10,),
                        /// products
                        GridView.builder(
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
                              ProductModelSardor currentProduct =
                                  ProductModelSardor.fromJson(
                                      reff.productsForHome![index]);
                              log("image infos");
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailsPage(
                                        product:
                                            currentProduct,
                                      ),
                                    ),
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
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Center(
                                            // child: Image.asset('assets/images/horse.png')
                                            child: currentProduct
                                                        .attachment.isEmpty ||
                                                    currentProduct.attachment[0]
                                                        .contentUrl.isEmpty
                                                ? Image.asset(
                                                    "assets/images/404.jpg",
                                                    height: 160,
                                                    width: 180,
                                                  )
                                                : Image.network(
                                                    'https://dominant-soft-development.up.railway.app/attachment/5',
                                                    height: 160,
                                                    width: 180,
                                                    loadingBuilder: (BuildContext
                                                            context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      } else {
                                                        return Center(
                                                          child: SizedBox(
                                                            height: 160,
                                                            width: 180,
                                                            child:
                                                                CircularProgressIndicator(
                                                              value: loadingProgress
                                                                          .expectedTotalBytes !=
                                                                      null
                                                                  ? loadingProgress
                                                                          .cumulativeBytesLoaded /
                                                                      loadingProgress
                                                                          .expectedTotalBytes!
                                                                  : null,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                          
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  currentProduct.productName,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                FavoriteButton(
                                                  iconSize: 30,
                                                  valueChanged: (isFavorite) {
                                                    if (isFavorite) {
                                                      /// Get the provider and add the product to likedProducts
                                                      ref
                                                          .read(
                                                              likedProductsProvider
                                                                  .notifier)
                                                          .addToLikedProducts(
                                                            currentProduct
                                                          );
                                                    }
                                                  },
                                                  context: context,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "\$${currentProduct.price}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              truncateText(
                                                  currentProduct.description,
                                                  25),
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

                              /// Return an empty SizedBox as a placeholder
                              return const SizedBox();
                            }
                          },
                        )
                        
                      ],
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Center(
                    child: CircularProgressIndicator(),
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
