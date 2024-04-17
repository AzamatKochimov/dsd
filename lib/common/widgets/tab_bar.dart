import 'package:dsd/common/widgets/navigation_bar.dart';
import 'package:dsd/feature/cart/presentation/pages/cart_page.dart';
import 'package:dsd/feature/home/presentation/pages/home_page.dart';
import 'package:dsd/feature/likes/presentation/pages/likes_page.dart';
import 'package:dsd/feature/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/crud/presentation/pages/add_item_home_page.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const LikesPage(),
    const AddItemHomePage(),
    const CartPage(),
    const Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 82.h,
        child: NavigationBars(
          onTap: onTabTapped,
        ),
      ),
    );
  }
}

