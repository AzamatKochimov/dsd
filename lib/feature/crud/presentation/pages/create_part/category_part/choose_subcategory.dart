import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/custom_text_widget.dart';
import 'package:dsd/feature/crud/models/category_model.dart';
import 'package:dsd/feature/crud/models/subcategory_model.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/extra_later_will_be_deleted/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../add_item_home_page.dart';

class ChooseSubcategory extends StatelessWidget {
  const ChooseSubcategory({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments;
    if (data is Categories) {
      return Scaffold(
          appBar: AppBar(
            leading: const CustomArrowBackButton(),
          ),
          body: Column(
            children: [
              Card(
                color: AppColors.c202020,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    width: 61.w,
                    // height: 61.h,
                  ),
                  title: customTextWidget(
                      text: data.name,
                      // color: AppColors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  var currentItem = data.categoryDtoList[i];
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppRouteName.CREATE_PRODUCT_ONE,
                          arguments: data);
                    },
                    title: customTextWidget(text: currentItem.name.toString()),
                  );
                },
                separatorBuilder: (cntx, i) {
                  return const Divider();
                },
                itemCount: data.categoryDtoList.length,
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
