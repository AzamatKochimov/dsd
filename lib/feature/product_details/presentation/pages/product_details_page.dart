import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/data/entities/product_model_sardor.dart';
import 'package:dsd/feature/cart/view_model/cart_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  final ProductModelSardor product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  ConsumerState<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
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
      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
        ref.watch(addedToCartProvider);
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Product image
                SizedBox(
                  width: 350.w,
                  child: widget.product.attachment.isEmpty ||
                          widget.product.attachment[0].contentUrl.isEmpty
                      ? Image.asset(
                          "assets/images/404.jpg",
                          height: 350.h,
                          width: 350.w,
                        )
                      : Image.network(
                          'https://dominant-soft-development.up.railway.app/attachment/5',
                          height: 350.h,
                          width: 350.w,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                ),

                /// Product name
                Text(
                  widget.product.productName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
                SizedBox(height: 6.h),

                /// Product price
                Text(
                  "\$${widget.product.price}",
                  style: const TextStyle(
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
                Text(
                  widget.product.description,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 312.w,
                  child: SizedBox(
                    width: 312.w,
                    child: ElevatedButton(
                      onPressed: () {
                        _addToCart(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.c57C5B6),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    Text(
                      widget.product.conditionProduct,
                      style: const TextStyle(
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
                    Text(
                      '${widget.product.availability}',
                      style: const TextStyle(
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
                      'only by UZPost',
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
                          'salesman: ',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          '${widget.product.seller.firstName} ${widget.product.seller.lastName} :',
                          style: const TextStyle(
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
                    SvgPicture.asset('assets/images/profile-default.svg',
                        width: 34.w, height: 34.h),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _addToCart(BuildContext context) {
    ref.read(addedToCartProvider.notifier).addToCartProvider(ProductModelSardor(
          id: widget.product.id,
          productName: widget.product.productName,
          price: widget.product.price,
          productCategory: widget.product.productCategory,
          availability: widget.product.availability,
          payType: widget.product.payType,
          conditionProduct: widget.product.conditionProduct,
          description: widget.product.description,
          seller: widget.product.seller,
          attachment: widget.product.attachment,
          productDtoLists: widget.product.productDtoLists,
        ));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product added to cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
