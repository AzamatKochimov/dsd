import 'dart:developer';

import 'package:dsd/feature/auth/view_model/auth_vm.dart';
import 'package:dsd/feature/crud/presentation/pages/add_item_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/home/presentation/widgets/favorite_button.dart';
import 'package:dsd/feature/likes/view_model/likes_vm.dart';
import 'package:dsd/feature/product_details/presentation/pages/product_details_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikesPage extends ConsumerWidget {
  const LikesPage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likedProducts = ref.watch(likedProductsProvider);

    log("${ref.watch(loginref).currentUserToken}");

    if (ref.watch(loginref).currentUserToken == null || ref.watch(loginref).currentUserToken!.isEmpty) {
      return const NotLoggedInUi();
    }

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
            color: AppColors.white,
          ),
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
                    width: 200,
                    height: 200,
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
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 260,
              ),
              itemBuilder: (context, index) {
                final currentProduct = likedProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          product: currentProduct,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff313131),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Image.asset(
                              'assets/images/horse.png',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  FavoriteButton(
                                    iconSize: 30,
                                    valueChanged: (isFavorite) {
                                      if (isFavorite) {
                                        ref
                                            .read(likedProductsProvider.notifier)
                                            .addToLikedProducts(currentProduct);
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
                                truncateText(currentProduct.description, 40),
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
              },
            ),
    );
  }

  String truncateText(String text, int maxLength) {
    if (text.length > maxLength) {
      return '${text.substring(0, maxLength)}...';
    } else {
      return text;
    }
  }
}