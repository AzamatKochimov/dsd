import 'package:dsd/common/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

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
            icon: SvgPicture.asset('assets/icons/share-w.svg', width: 30, height: 30)),
          IconButton(
            onPressed: () {
              //write add to cart logic here
            },
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset('assets/icons/cart-w.svg', width: 28, height: 28),
            ),
          ),
        ],
      ),
    );
  }
}