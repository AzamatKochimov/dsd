import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/custom_text_widget.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/extra_later_will_be_deleted/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../add_item_home_page.dart';

class ChooseSubcategory extends StatelessWidget {
  const ChooseSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments;
    if (data is CategoryModel) {
      return Scaffold(
          appBar: AppBar(
            leading: const CustomArrowBackButton(),
          ),
          body: Column(
            children: [
              Card(
                color: AppColors.white,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    width: 61.w,
                    // height: 61.h,
                  ),
                  title: customTextWidget(text: data.categoryName, color: AppColors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                itemBuilder: (context, i) {
                  var currentItem = data.subCategories[i];
                  return ListTile(
                    title: customTextWidget(text: currentItem.subCategoryName),
                  );
                },
                separatorBuilder: (cntx, i) {
                  return const Divider();
                },
                itemCount: data.subCategories.length,
              )),
            ],
          ));
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Nothing Found'),
        ),
      );
    }
  }
}
