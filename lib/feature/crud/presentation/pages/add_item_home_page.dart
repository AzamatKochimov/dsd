import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/add_item_vm.dart';
import '../widgets/custom_nav_bar_item.dart';
import 'active_products_page.dart';
import 'draft_products_page.dart';

List<Widget> pages = [
  const ActiveProductsPage(),
  const DraftProductsPage(),
];

class AddItemHomePage extends StatelessWidget {
  const AddItemHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        // backgroundColor: AppColors.black,
        leading: const CustomArrowBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            const CustomAppNavBar(navBarLabels: ['active products', 'draft']),
            Expanded(
              child: Consumer(
                builder: (cntx, ref, child) {
                  final currentPageIndex = ref.watch(currentPageIndexProvider);
                  return IndexedStack(
                    index: currentPageIndex,
                    children: pages,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomArrowBackButton extends StatelessWidget {
  const CustomArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
      color: Colors.white,
    );
  }
}
