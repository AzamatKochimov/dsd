import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/feature/crud/presentation/widgets/general_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/const/assets/images.dart';

class DraftProductsPage extends StatelessWidget {
  const DraftProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.black,
        body: CustomScrollView(
      slivers: [
        // SliverToBoxAdapter(
        //   child: Image.asset(ConstImages.CARD_IMAGE),
        // ),
        SliverAppBar(
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          title: const Text('Draft Ads'),
          // floating: true,
          expandedHeight: 200.h,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // height: 400.h,
                  ConstImages.AD_IMAGE),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: spaceWidget(isHeight: true, size: 35),
        ),
        SliverGrid(
          delegate: SliverChildListDelegate(List.generate(6, (index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
          })),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 2,
              // childAspectRatio: (itemWidth / itemHeight),
              mainAxisExtent: 350.h),
        ),
      ],
    ));
  }
}
