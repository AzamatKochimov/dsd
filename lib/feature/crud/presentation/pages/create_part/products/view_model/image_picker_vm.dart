import 'package:device_preview/device_preview.dart';
import 'package:dsd/feature/crud/models/image_model.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/products/view_model/attachment_vm.dart';
import 'package:dsd/feature/crud/services/get_categories_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:l/l.dart';

final imageProvider = StateNotifierProvider<CustomImageNotifier, XFile?>(
    (ref) => CustomImageNotifier(ref));

class CustomImageNotifier extends StateNotifier<XFile?> {
  CustomImageNotifier(this.ref) : super(null);
  final Ref ref;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage(bool useCamera) async {
    final source = useCamera ? ImageSource.camera : ImageSource.gallery;
    final XFile? imageFile = await _imagePicker.pickImage(source: source);
    if (imageFile != null) {
      state = imageFile;
      try {
        int imageId = await GetCategoriesService.uploadImage(
            GetCategoriesService.apiUploadImageAttachment, imageFile);
        ref.read(attachmentIdsProvider.notifier).addAttachmentId(imageId);
        l.i("$imageId raqamli id olindi serverdan");
      } catch (e) {
        l.e('$e rasm idsi olinmadi');
      }
    }
  }

  void clearImage() => state = null;
}
