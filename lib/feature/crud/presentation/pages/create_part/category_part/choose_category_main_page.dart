import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/custom_text_widget.dart';
import 'package:dsd/feature/crud/models/category_model.dart';
import 'package:dsd/feature/crud/presentation/pages/add_item_home_page.dart';
import 'package:dsd/feature/crud/view_model/get_categories_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:l/l.dart';
import '../../../widgets/general_widgets.dart';

class ChooseCategoryMainPage extends ConsumerWidget {
  const ChooseCategoryMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Categories>> categoriesData =
        ref.watch(getCategoriesProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customTextWidget(text: "Category", fontSize: 20),
        leading: const CustomArrowBackButton(),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            spaceWidget(isHeight: true, size: 10),
            Expanded(
                child: categoriesData.when(
                    data: (data) => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return spaceWidget(isHeight: true, size: 10);
                          },
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            var currentItem = data[index];
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              color: AppColors.c202020,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRouteName.CHOOSESUBCATEGORY,
                                      arguments: currentItem);
                                },
                                contentPadding: const EdgeInsets.all(5),
                                leading: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 61.w,
                                  // height: 61.h,
                                ),
                                title: customTextWidget(
                                    text: currentItem.name.toString(),
                                    // color: AppColors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                subtitle: customTextWidget(
                                    text: currentItem.attachment.toString(),
                                    // color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                trailing: const Icon(
                                  Icons.navigate_next_outlined,
                                  // color: AppColors.black,
                                  size: 30,
                                ),
                              ),
                            );
                          },
                        ),
                    error: (error, stack) {
                      l.e(error);
                      l.e(stack);
                      return Center(
                        child: customTextWidget(text: 'Oops, smth went wrong'),
                      );
                    },
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        )))
          ],
        ),
      ),
    );
  }
}
