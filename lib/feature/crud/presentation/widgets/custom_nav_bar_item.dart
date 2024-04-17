import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/add_item_vm.dart';

class CustomAppNavBar extends ConsumerWidget {
  final List<String> navBarLabels;

  const CustomAppNavBar({super.key, required this.navBarLabels});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentTabBarPageIndexCrudProvider);
    return SafeArea(
      child: Container(
        // height: 60,
        // padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          // color: Colors.white,
          //         color: Color(0x00ffffff),
          borderRadius: BorderRadius.circular(12),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Color.fromRGBO(63, 61, 86, 0.24),
          //     // color: Colors.red,
          //     offset: Offset(5, 5),
          //     blurRadius: 15,
          //     spreadRadius: 1,
          //   ),
          //   BoxShadow(
          //     color: Color.fromRGBO(63, 61, 86, 0.24),
          //     // color: Colors.green,
          //     offset: Offset(-5, -5),
          //     blurRadius: 15,
          //     spreadRadius: 1,
          //   ),
          // ],
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              navBarLabels.length,
              (index) => Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: MaterialButton(
                    height: 48.9,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: currentIndex == index
                        ? AppColors.c57C5B6
                        : Colors.white,
                    onPressed: () {
                      ref.read(currentTabBarPageIndexCrudProvider.notifier).state = index;
                    },
                    child: Text(
                      navBarLabels[index],
                      style: TextStyle(
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.black,
                      fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
