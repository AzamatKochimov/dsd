import 'package:dsd/feature/crud/services/get_categories_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageProvider = StateNotifierProvider<CustomImageNotifier, XFile?>(
        (ref) => CustomImageNotifier());

class CustomImageNotifier extends StateNotifier<XFile?> {
  CustomImageNotifier() : super(null);

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage(bool useCamera)async{
    final source = useCamera ? ImageSource.camera : ImageSource.gallery;
    final XFile? imageFile = await _imagePicker.pickImage(source: source);
    if(imageFile != null){
      state = imageFile;
      GetCategoriesService.uploadImage(GetCategoriesService.apiUploadImageAttachment, imageFile);
    }
  }


  void clearImage() => state = null;
}