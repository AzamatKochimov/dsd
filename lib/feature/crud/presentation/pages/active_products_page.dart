import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/crud/presentation/widgets/general_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/const/assets/images.dart';

class ActiveProductsPage extends StatelessWidget {
  const ActiveProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // var itemWidth = size.width / 2;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 200.h,
                ConstImages.AD_IMAGE),
          )),
          const SliverAppBar(
            centerTitle: true,
            title: Text('Ads'),
            pinned: true,
          ),
          const CustomProductsCardGridView(),
        ],
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}

// custom grid view for cards
class CustomProductsCardGridView extends StatelessWidget {
  const CustomProductsCardGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildListDelegate(List.generate(10, (index) {
        return const CustomProductCard();
      })),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 2,
          // childAspectRatio: (itemWidth / itemHeight),
          mainAxisExtent: 350.h),
    );
  }
}

// custom card for products (CRUD)
class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
                height: 140.h,
                width: double.infinity,
                fit: BoxFit.cover,
                ConstImages.CARD_IMAGE),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: const Text(
              'Savannah Tigr',
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '1 240 \$',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                const Text(
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    'Very smart and big aaaaaa'),
                const Text('condition: 5 years'),
                const Text('Russian, Moscow'),
                const Text('18 February 2024'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '16:02',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}

// add new product
class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.c57C5B6, borderRadius: BorderRadius.circular(50)),
      width: double.infinity,
      child: FloatingActionButton(
        backgroundColor: AppColors.c57C5B6,
        onPressed: () {
          // Navigator.pushNamed(context, AppRouteName.CHILDREN_PRODUCT_PAGE);
          Navigator.pushNamed(context, AppRouteName.CHOOSECATEGORYMAINPAGE);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: Colors.black),
            spaceWidget(isHeight: false, size: 10),
            const Text(
              'Place an ad',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
