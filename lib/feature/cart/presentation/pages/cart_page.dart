import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/custom_text_widget.dart';
import 'package:dsd/feature/cart/view_model/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasketPage extends ConsumerStatefulWidget {
  const BasketPage({super.key});

  @override
  ConsumerState<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends ConsumerState<BasketPage> {
  @override
  Widget build(BuildContext context) {
    final addedToBasket = ref.watch(addedtoCartProvider);
    return Scaffold(
      backgroundColor: AppColors.c202020,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Basket',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.white),
        ),
      ),
      body: addedToBasket.isEmpty
          ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff313131),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/horse_bashara.png',
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTextWidget(
                                    text: "Black hourse 1.5m",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                                customTextWidget(
                                    text: "450 \$",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700),
                                customTextWidget(
                                    text: "Very smart and big...",
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400),
                                customTextWidget(
                                    text: "condition: 10 years ",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                customTextWidget(
                                  text: "18 February 4:02 pm",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.location_on_rounded,
                                        color: AppColors.c57C5B6),
                                    customTextWidget(
                                        text: "Kazakhstan, Almaty",
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_circle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff313131),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/horse_bashara.png',
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTextWidget(
                                    text: "Black hourse 1.5m",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                                customTextWidget(
                                    text: "450 \$",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700),
                                customTextWidget(
                                    text: "Very smart and big...",
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400),
                                customTextWidget(
                                    text: "condition: 10 years ",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                customTextWidget(
                                  text: "18 February 4:02 pm",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.location_on_rounded,
                                        color: AppColors.c57C5B6),
                                    customTextWidget(
                                        text: "Kazakhstan, Almaty",
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_circle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: addedToBasket.length,
              itemBuilder: (context, index) {
                final product = addedToBasket[index];
                return Container(
                  padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff313131),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/horse_bashara.png',
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTextWidget(
                                    text: product.name,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                                customTextWidget(
                                    text: product.price,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700),
                                customTextWidget(
                                    text: product.description,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400),
                                customTextWidget(
                                    text: product.condition,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                customTextWidget(
                                  text: "18 February 4:02 pm",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.location_on_rounded,
                                        color: AppColors.c57C5B6),
                                    customTextWidget(
                                        text: "Kazakhstan, Almaty",
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    ref
                                        .read(addedtoCartProvider.notifier)
                                        .removeFromCart(index);
                                  },
                                  icon: const Icon(Icons.remove_circle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    floatingActionButton: const Text('Hello motherfather!'),
    );
  }
}
