import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/material.dart';

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
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: _currentIndex == 0
              ? Image.asset(
                  "assets/icons/home-g.png",
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  "assets/icons/home-b.png",
                  width: 24,
                  height: 24,
                ),
          label: 'menu',
        ),
        BottomNavigationBarItem(
          icon: _currentIndex == 1
              ? Image.asset(
                  "assets/icons/like-g.png",
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  "assets/icons/like-b.png",
                  width: 24,
                  height: 24,
                ),
          label: 'likes',
          activeIcon: Icon(Icons.add),
          backgroundColor: AppColors.black
        ),
        BottomNavigationBarItem(
          icon: _currentIndex == 2
              ? Image.asset(
                  "assets/icons/add-g.png",
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  "assets/icons/add-b.png",
                  width: 24,
                  height: 24,
                ),
          label: 'add',
        ),
        BottomNavigationBarItem(
          icon: _currentIndex == 3
              ? Image.asset(
                  "assets/icons/cart-g.png",
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  "assets/icons/cart-b.png",
                  width: 24,
                  height: 24,
                ),
          label: 'basket',
        ),
        BottomNavigationBarItem(
          icon: _currentIndex == 4
              ? Image.asset(
                  "assets/icons/profile-g.png",
                  width: 24,
                  height: 24,
                )
              : Image.asset(
                  "assets/icons/profile-b.png",
                  width: 24,
                  height: 24,
                ),
          label: 'profile',
        ),
      ],
    );
  }
}