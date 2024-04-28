import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../common/router/route_name.dart';
import '../../../../../../../common/styles/colors.dart';
import '../../../../../../../common/widgets/custom_text_widget.dart';
import '../../../../../models/category_model.dart';

/* This widget is for showing the product category, it is located in product creation part */

class ProductCategoryNameWidget extends StatelessWidget {
  const ProductCategoryNameWidget({
    super.key,
    required this.data,
  });

  final Categories data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.hardEdge,
      color: AppColors.c202020,
      child: ListTile(
        contentPadding: const EdgeInsets.only(right: 25, left: 10, top: 10, bottom: 10),
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          width: 61.w,
          // height: 61.h,
        ),
        title: customTextWidget(
            text: data.name,
            // color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700),
        trailing: const CustomTextWidget(
          text: 'Change',
        textColor: Colors.grey,
        )
      ),
    );
  }
}
