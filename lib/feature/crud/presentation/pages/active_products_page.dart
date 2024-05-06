import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/data/entities/product_model_sardor.dart';
import 'package:dsd/feature/crud/presentation/widgets/general_widgets.dart';
import 'package:dsd/feature/crud/view_model/get_categories_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:l/l.dart';
import '../../../../common/const/assets/images.dart';
import '../../../../common/widgets/custom_text_widget.dart';

class ActiveProductsPage extends StatelessWidget {
  const ActiveProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // var itemWidth = size.width / 2;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
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
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}

// custom grid view for cards
class CustomProductsCardGridView extends ConsumerWidget {
  const CustomProductsCardGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<ProductModelSardor>> products =
        ref.watch(getActiveProducts);
    return products.when(
        data: (data) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(childCount: data.length,
                (context, index) {
              final product = data[index];
              return CustomProductCard(product: product);
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
                // childAspectRatio: (itemWidth / itemHeight),
                mainAxisExtent: 350.h),
          );
        },
        error: (error, stack) {
          l.e(error);
          l.e(stack);
          return SliverFillRemaining(
            child: Center(
              child: customTextWidget(text: 'Oops, something went wrong'),
            ),
          );
        },
        loading: () => const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}

// custom card for products (CRUD)
class CustomProductCard extends StatelessWidget {
  final ProductModelSardor product;

  const CustomProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: product.attachment.isEmpty ||
                    product.attachment[0].contentUrl.isEmpty
                ? Image.asset(
                    ConstImages.CARD_IMAGE,
                    height: 160,
                    width: 180,
                  )
                : Image.network(
              // product.attachment[0].contentUrl,
                    'https://dominant-soft-development.up.railway.app/attachment/5',
                    height: 160,
                    width: 180,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: SizedBox(
                            height: 160,
                            width: 180,
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      }
                    },
                  ),
          ),
          ListTile(
            isThreeLine: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              product.productName,
              style: const TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.price} \$',
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                Text(
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    product.description),
                const Text('condition: 5 years'),
                const Text('Russian, Moscow'),
                const Text('18 February 2024'),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text(
                //       '16:02',
                //       overflow: TextOverflow.ellipsis,
                //       style: TextStyle(fontSize: 14),
                //     ),
                //     IconButton(
                //       onPressed: () {},
                //       icon: const Icon(
                //         Icons.edit,
                //         size: 20,
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
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
