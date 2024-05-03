import 'package:dsd/common/router/route_name.dart';
import 'package:dsd/feature/crud/models/product_model.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/products/pages/create_product_1.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/products/view_model/image_picker_vm.dart';
import 'package:dsd/feature/crud/services/get_categories_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';

enum AddProductState { initial, loading, success, error }

final addProductNotifierProvider =
    StateNotifierProvider<AddProductNotifier, String?>(
        (ref) => AddProductNotifier());

// controllers
final nameControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final priceControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final descriptionControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

final addProductStateProvider =
    StateProvider<AddProductState>((ref) => AddProductState.initial);

class AddProductNotifier extends StateNotifier<String?> {
  AddProductNotifier() : super(null);

  Future<void> productAdd(
      {required BuildContext context,
      required WidgetRef ref,
      required String productName,
      required double price,
      required productCategoryID,
      required bool availability,
      required String payType,
      required String conditionProduct,
      required String description,
      required int sellerID,
      required List<int> attachmentIDS,
      required List<dynamic> productDTOS}) async {
    ref.read(addProductStateProvider.notifier).state = AddProductState.loading;
    try {
      final newProduct = ProductModelForCreating(
          productName: productName,
          price: price,
          productCategory: productCategoryID,
          availability: availability,
          payType: payType,
          conditionProduct: conditionProduct,
          description: description,
          sellerId: sellerID,
          attachmentIds: attachmentIDS,
          productFeaturesDtos: productDTOS.isNotEmpty
              ? productDTOS
              : [] // Ensure this is correct
          );
      String jsonToSend = productModelToJson(newProduct);
      l.i("JSON to send: $jsonToSend");
      l.i(jsonToSend); // This will help you verify the JSON structure
      String response = await GetCategoriesService.createProduct(
          GetCategoriesService.apiAddNewProductAPI, jsonToSend);
      state = response;
      l.i("$state");

      ref.read(nameControllerProvider).clear();
      ref.read(priceControllerProvider).clear();
      ref.read(descriptionControllerProvider).clear();
      ref.read(imageProvider.notifier).clearImage();

      ref.read(addProductStateProvider.notifier).state =
          AddProductState.success;
      Navigator.pushReplacementNamed(context, AppRouteName.ADDITEMHOMEPAGE);
    } catch (e) {
      ref.read(addProductStateProvider.notifier).state = AddProductState.error;
      l.e('$e');
    }
    // String response = await GetCategoriesService.createProduct(
    //     GetCategoriesService.apiAddNewProductAPI,
    //     productModelToJson(newProduct));
    // state = response;
    // print(state);
  }
}
