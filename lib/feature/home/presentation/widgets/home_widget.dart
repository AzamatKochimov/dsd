import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/data/entities/product_list_model.dart';
import 'package:dsd/feature/home/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Container(
      width: 280.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: AppColors.greenishBlue,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 15.w,
          ),
          SvgPicture.asset(
            'assets/icons/searchplus.svg',
            width: 20.w,
            height: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 180.w,
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                fillColor: Colors.transparent,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "search",
                hintStyle: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            'assets/icons/searchparams.svg',
            width: 20.w,
            height: 20,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
    );
  }
}

class AllRegionsDropDown extends ConsumerStatefulWidget {
  const AllRegionsDropDown({super.key});

  @override
  ConsumerState<AllRegionsDropDown> createState() => _AllRegionsDropDownState();
}

class _AllRegionsDropDownState extends ConsumerState<AllRegionsDropDown> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ref.watch(homeref);
      return Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.greenishBlue),
        child: Center(
          child: DropdownButton(
            style: const TextStyle(color: AppColors.white),
            value: ref.watch(homeref).dropdownvalue,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            dropdownColor: AppColors.background,
            items: ref.watch(homeref).numberCodes.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              ref.watch(homeref).swapDropdownValue(newValue);
            },
          ),
        ),
      );
    });
  }
}

class CategoriesWidget extends ConsumerStatefulWidget {
  const CategoriesWidget({super.key});

  @override
  ConsumerState<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends ConsumerState<CategoriesWidget> {
  Map<String, String> categoryList = {
    "Transport": "assets/images/car.png",
    "Real Estate": "assets/images/real-estate.png",
    "Animals": "assets/images/animals.png",
    "Child's World": "assets/images/child.png",
    "Electronics": "assets/images/electronics.png",
    "Constructions": "assets/images/constructions.png",
  };

  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      itemBuilder: (context, index) {
        String categoryName = categoryList.keys.elementAt(index);
        String imagePath = categoryList.values.elementAt(index);
        return Container(
          height: 54.h,
          width: 90.w,
          decoration: BoxDecoration(
              color: AppColors.c313131,
              border: Border.all(color: AppColors.c57C5B6, width: 2.5),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
                child: Text(
                  categoryName,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Image.asset(
                imagePath,
                height: 40.h,
                width: 84.w,
              ),
            ],
          ),
        );
      },
    );
  }
}

// class ProductGenerator extends ConsumerStatefulWidget {
//   const ProductGenerator({super.key});

//   @override
//   ConsumerState<ProductGenerator> createState() => _ProductGeneratorState();
// }

// class _ProductGeneratorState extends ConsumerState<ProductGenerator> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, AppRouteName.PRODUCT_DETAILS_PAGE);
//       },
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         // itemCount: likedProducts.length,
//         itemCount: 6,
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200.w, // Maximum width of each item
//           mainAxisSpacing: 10.0, // Spacing between rows
//           crossAxisSpacing: 8.0, // Spacing between columns
//           mainAxisExtent: 260.h, // Height of each item
//         ),
//         itemBuilder: (context, index) {
//           // final product = likedProducts[index];
//           return Container(
//             decoration: const BoxDecoration(
//               color: Color(0xff313131),
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 200.w,
//                   child: Image.asset(
//                     'assets/images/horse.png',
//                     //product.imageUrl
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               /// Title
//                               Text(
//                                 // product.name,
//                                 "Black hourse 1.5m",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10,
//                                 ),
//                               ),

//                               /// Product Price
//                               Text(
//                                 // product.price,
//                                 "450 \$",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 10,
//                                 ),
//                               ),

//                               /// Product Description
//                               Text(
//                                 // product.description,
//                                 "Very smart and big...",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 10,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           FavoriteButton(
//                             iconSize: 34,
//                             isFavorite: false,
//                             valueChanged: (isFavorite) {
//                               if (isFavorite) {
//                                 /// Get the provider and add the product to likedProducts
//                                 ref
//                                     .read(likedProductsProvider.notifier)
//                                     .addToLikedProducts(
//                                       Product(
//                                         name: "Black horse 1.5m",
//                                         price: "1.2 mil",
//                                         description: "Very smart and big...",
//                                       ),
//                                     );
//                               }
//                               // else {
//                               //   // Remove the product from the liked products list
//                               //   ref
//                               //       .read(likedProductsProvider.notifier)
//                               //       .removeFromLikedProducts(product);
//                               // }
//                             },
//                             context: context,
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 15.h),
//                       const Text(
//                         "Kazakhstan, Almaty",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w700,
//                           fontSize: 10,
//                         ),
//                       ),
//                       const Text(
//                         "18 February 4:02 pm",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class ProductGenerator extends ConsumerStatefulWidget {
  const ProductGenerator({super.key});

  @override
  ConsumerState<ProductGenerator> createState() => _ProductGeneratorState();
}

class _ProductGeneratorState extends ConsumerState<ProductGenerator> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var reff = ref.watch(homeref);
        var products = reff.productsForHome;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reff.productsForHome?.length ?? 0, // Added null check here
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.w, // Maximum width of each item
            mainAxisSpacing: 10.0, // Spacing between rows
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisExtent: 250.h, // Height of each item
          ),
          itemBuilder: (context, index) {
            ProductListModel currentProduct = products![index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouteName.PRODUCT_DETAILS_PAGE,
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff313131),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: currentProduct.attachment.isNotEmpty
                          ? Image.network(
                              currentProduct.attachment[0].contentUrl,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              "assets/images/imagenotfound.png",
                              fit: BoxFit.fill,
                            ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentProduct.productName,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "${currentProduct.price}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            truncateText(currentProduct.description, 20),
                            style: const TextStyle(
                                color: Color.fromARGB(230, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
