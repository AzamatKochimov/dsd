import 'package:dsd/common/widgets/navigation_bar.dart';
import 'package:dsd/feature/cart/presentation/pages/cart_page.dart';
import 'package:dsd/feature/home/presentation/pages/home_page.dart';
import 'package:dsd/feature/likes/presentation/pages/likes_page.dart';
import 'package:dsd/feature/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/crud/presentation/pages/add_item_home_page.dart';

class TabScreen extends ConsumerWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(currentIndexProvider);

    final List<Widget> children = [
      const HomePage(),
      LikesPage(),
      const AddItemHomePage(),
      const CartPage(),
      const Profile(),
    ];

    return Scaffold(
      body: children[currentPageIndex],
      bottomNavigationBar: SizedBox(
        height: 82.h,
        child: const NavigationBars(),
      ),
    );
  }
}
