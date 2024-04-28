import 'dart:io';
import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/custom_text_widget.dart';
import 'package:dsd/feature/crud/models/category_model.dart';
import 'package:dsd/feature/crud/presentation/pages/add_item_home_page.dart';
import 'package:dsd/feature/crud/presentation/widgets/general_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/image_picker_widget.dart';
import '../widgets/show_category_name_widget.dart';

class CreateProductOnePage extends ConsumerWidget {
  const CreateProductOnePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ModalRoute.of(context)?.settings.arguments as Categories;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const CustomArrowBackButton(),
        actions: [
          TextButton(
              onPressed: () {},
              child: const CustomTextWidget(text: 'save as draft'))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom // Adjust padding dynamically
              ),
          child: Column(
            children: [
              //! Add photo
              const ImagePickerWidget(),
              //! category
              ProductCategoryNameWidget(data: data),
              //! text_fields
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(text: 'Name product'),
                  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  CustomTextWidget(text: 'Description'),
                  TextField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ],
              ),

              //! price
              const CustomTextWidget(text: 'Price'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  spaceWidget(isHeight: false, size: 10),
                  const CurrenciesDropDown()
                ],
              ),

              //! state
              const CustomTextWidget(text: 'State'),
              const StateWidget(),

              //! product_location
              const CustomTextWidget(text: 'Location Product'),
              CentralAsianDropdown(),

              spaceWidget(isHeight: true, size: 20),

              //! user_info
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.c202020),
                    child: const CustomTextWidget(
                      text: "+998904430302",
                    ),
                  )
                ],
              ),

              spaceWidget(isHeight: true, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
