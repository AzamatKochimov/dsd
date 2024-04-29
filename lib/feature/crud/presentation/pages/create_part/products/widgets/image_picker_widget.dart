import 'dart:io';
import 'package:dsd/common/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../pages/view_picked_image_page.dart';
import '../view_model/image_picker_vm.dart';

/* This Widget is for picking images locally  */

//! Rewrite this code one more time, it is vey good structured code

class ImagePickerWidget extends ConsumerWidget {
  const ImagePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImage = ref.watch(imageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, bottom: 5),
          child: Text(
            'Add photo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              if (pickedImage != null)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (cnt) =>
                              FullScreenImagePage(imagePath: pickedImage.path),
                        ));
                  },
                  child: Image.file(
                    File(pickedImage.path),
                    width: double.infinity,
                    height: 250,
                  ),
                )
              else
                const Placeholder(
                  fallbackHeight: 250,
                  fallbackWidth: double.infinity,
                ),
              _buildIconButton(context, ref, pickedImage),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildIconButton(
      BuildContext context, WidgetRef ref, XFile? pickedImage) {
    return IconButton(
      onPressed: () => pickedImage != null
          ? ref.read(imageProvider.notifier).clearImage()
          : _showImageSourceDialog(context, ref),
      icon: Icon(pickedImage != null ? Icons.delete : Icons.upload),
    );
  }

  void _showImageSourceDialog(BuildContext context, WidgetRef ref) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const CustomTextWidget(
                text: 'Choose ...',
              ),
              actions: [
                _buildDialogOption(
                    context, ref, Icons.camera_alt, 'Open Camera', true),
                _buildDialogOption(
                    context, ref, Icons.image, 'Open Gallery', false)
              ],
            ));
  }

  Widget _buildDialogOption(BuildContext context, WidgetRef ref, IconData icon,
      String text, bool isCamera) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Column(children: [Icon(icon), Text(text)]));
  }
}
