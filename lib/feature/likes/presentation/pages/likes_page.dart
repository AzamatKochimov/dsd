import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/home/presentation/widgets/favorite_button.dart';
import 'package:dsd/feature/likes/view_model/likes_vm.dart';
import 'package:dsd/feature/product_details/presentation/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikesPage extends ConsumerWidget {
  const LikesPage({super.key});
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
                itemCount: likedProducts.length ??
                    0, // Ensure products is not null
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.w,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 8.0,
                  mainAxisExtent: 260.h,
                ),
                itemBuilder: (context, index) {
                  final currentProduct = likedProducts[index];
                  print("null null null");
                  if (index <= likedProducts.length) {
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
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
                                    child:
                                        Image.asset('assets/images/horse.png')
                                    // currentProduct
                                    //             .attachment.isEmpty ||
                                    //         currentProduct.attachment[0]
                                    //             .contentUrl.isEmpty
                                    //     ? Image.asset(
                                    //         "assets/images/404.jpg",
                                    //         height: 140,
                                    //         width: 160,
                                    //       )
                                    //     : Image.network(
                                    //         'http://192.168.0.122:8080/attachment/${currentProduct.attachment[0].id}',
                                    //         height: 140,
                                    //         width: 160,
                                    //         loadingBuilder: (BuildContext
                                    //                 context,
                                    //             Widget child,
                                    //             ImageChunkEvent?
                                    //                 loadingProgress) {
                                    //           if (loadingProgress ==
                                    //               null) {
                                    //             return child;
                                    //           } else {
                                    //             return Center(
                                    //               child: SizedBox(
                                    //                 height: 100,
                                    //                 width: 100,
                                    //                 child:
                                    //                     CircularProgressIndicator(
                                    //                   value: loadingProgress
                                    //                               .expectedTotalBytes !=
                                    //                           null
                                    //                       ? loadingProgress
                                    //                               .cumulativeBytesLoaded /
                                    //                           loadingProgress
                                    //                               .expectedTotalBytes!
                                    //                       : null,
                                    //                 ),
                                    //               ),
                                    //             );
                                    //           }
                                    //         },
                                    //       ),

                                    )),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            /// Get the provider and add the product to likedProducts
                                            ref
                                                .read(likedProductsProvider
                                                    .notifier)
                                                .addToLikedProducts(
                                                    currentProduct);
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
                                        currentProduct.description, 40),
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
                    print("Error: There are no products or the list is null");

                    /// Return an empty SizedBox as a placeholder
                    return const SizedBox();
                  }
                },
              ));
  }
}

String truncateText(String text, int maxLength) {
  if (text.length > maxLength) {
    return '${text.substring(0, maxLength)}...';
  } else {
    return text;
  }
}
