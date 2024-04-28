import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/data/entities/product_model.dart';
import 'package:dsd/feature/home/presentation/widgets/favorite_button.dart';
import 'package:dsd/feature/likes/view_model/likes_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedProducts = ref.watch(likedProductsProvider);

    return Scaffold(
      backgroundColor: AppColors.c202020,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.white),
        ),
      ),
      body: likedProducts.isEmpty
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/likes-404.svg',
                    width: 200.w,
                    height: 200.h,
                  ),
                  const Text(
                    'Liked post not available yet!',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: likedProducts.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.w, // Maximum width of each item
                mainAxisSpacing: 10.0, // Spacing between rows
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisExtent: 260.h, // Height of each item
              ),
              itemBuilder: (context, index) {
                final product = likedProducts[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xff313131),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Image.asset(
                          'assets/images/horse.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Title
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),

                                    /// Product Price
                                    Text(
                                      product.price,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                                    ),

                                    /// Product Description
                                    Text(
                                      product.description,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                FavoriteButton(
                                  iconSize: 34,
                                  isFavorite: true,
                                  valueChanged: (isFavorite) {
                                    if (isFavorite) {
                                      /// Get the provider and add the product to likedProducts
                                      ref
                                          .read(likedProductsProvider.notifier)
                                          .addToLikedProducts(
                                            Product(
                                              name: "Black horse 1.5m",
                                              price: "1.2 mil",
                                              description:
                                                  "Very smart and big...",
                                            ),
                                          );
                                    }else {
                                      // Remove the product from the liked products list
                                      ref
                                          .read(likedProductsProvider.notifier)
                                          .removeFromLikedProducts(product);
                                    }
                                  },
                                  context: context,
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            const Text(
                              "Kazakhstan, Almaty",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                            const Text(
                              "18 February 4:02 pm",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
