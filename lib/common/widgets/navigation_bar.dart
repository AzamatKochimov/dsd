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
