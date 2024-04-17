/*

import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationBars extends StatefulWidget {
  final ValueChanged<int> onTap;
  const NavigationBars({super.key, required this.onTap});

  @override
  _NavigationBarsState createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(color: AppColors.c0B8978),
      selectedItemColor: AppColors.c0B8978,
      // unselectedLabelStyle: const TextStyle(fontSize: 6, color: AppColors.c313131),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: SvgPicture.asset(
            _currentIndex == 0
                ? "assets/icons/home-g.svg"
                : "assets/icons/home-b.svg",
            width: 24,
            height: 24,
          ),
          label: 'menu',
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _currentIndex == 1
                  ? "assets/icons/like-g.svg"
                  : "assets/icons/like-b.svg",
              width: 24,
              height: 24,
            ),
            label: 'likes',
            backgroundColor: AppColors.black),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              _currentIndex == 2
                  ? "assets/icons/add-g.svg"
                  : "assets/icons/add-b.svg",
              width: 24,
              height: 24,
            ),
          label: 'add',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
              _currentIndex == 3
                  ? "assets/icons/cart-g.svg"
                  : "assets/icons/cart-b.svg",
              width: 24,
              height: 24,
            ),
          label: 'basket',
        ),
        BottomNavigationBarItem(
          tooltip: "profile",
          icon: SvgPicture.asset(
            _currentIndex == 4
                ? "assets/icons/profile-g.svg"
                : "assets/icons/profile-b.svg",
            width: 24,
            height: 24,
          ),
          label: 'profile',
        ),
      ],
    );
  }
}

*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/colors.dart';

// state for page index
final currentIndexProvider = StateProvider<int>((ref) => 0);

class NavigationBars extends ConsumerWidget {
  const NavigationBars({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(currentIndexProvider);

    BottomNavigationBarItem buildItem(
        String activeIcon, String inactiveIcon, String label) {
      return BottomNavigationBarItem(
        backgroundColor: AppColors.black,
        icon: SvgPicture.asset(
          currentPageIndex == label.hashCode ? activeIcon : inactiveIcon,
          width: 24,
          height: 24,
          color: AppColors.white,
        ),
        label: label,
      );
    }

    return BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) => ref.read(currentIndexProvider.notifier).state = index,
        selectedLabelStyle: const TextStyle(color: AppColors.white),
        selectedItemColor: AppColors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          buildItem(
              "assets/icons/home-g.svg", "assets/icons/home-b.svg", 'Home'),
          buildItem(
              "assets/icons/like-g.svg", "assets/icons/like-b.svg", 'Likes'),
          buildItem("assets/icons/add-g.svg", "assets/icons/add-b.svg", 'Add'),
          buildItem(
              "assets/icons/cart-g.svg", "assets/icons/cart-b.svg", 'Basket'),
          buildItem("assets/icons/profile-g.svg", "assets/icons/profile-b.svg",
              'Profile'),
        ]);
  }
}
