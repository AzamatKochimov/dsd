import 'package:dsd/common/styles/colors.dart';
import 'package:dsd/common/widgets/custom_text_widget.dart';
import 'package:dsd/feature/crud/presentation/pages/add_item_home_page.dart';
import 'package:dsd/feature/crud/presentation/widgets/general_widgets.dart';
import 'package:flutter/material.dart';

class CreateProductMainPage extends StatelessWidget {
  const CreateProductMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: customTextWidget(
                text: 'save as draft',
                color: Colors.grey,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            // text
            customTextWidget(
              text:
                  'Add a photo. The weight of the object should be visible in the photo.',
              fontSize: 20,
            ),
            spaceWidget(isHeight: true, size: 30),
            //addphotoofproduuctpart
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextWidget(text: 'photo', fontSize: 16),
                spaceWidget(isHeight: true, size: 10),
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.c57C5B6,
                        borderRadius: BorderRadius.circular(20)),
                    width: double.infinity,
                    height: 200,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(size: 35, Icons.camera_alt),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
