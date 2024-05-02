import 'package:dsd/feature/crud/models/product_model.dart';
import 'package:dsd/feature/crud/services/get_categories_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';

final addProductNotifierProvider =
    StateNotifierProvider<AddProductNotifier, String?>(
        (ref) => AddProductNotifier());

class AddProductNotifier extends StateNotifier<String?> {
  AddProductNotifier() : super(null);

  Future<void> productAdd(
      {required String productName,
      required double price,
      required productCategoryID,
      required bool availability,
      required String payType,
      required String conditionProduct,
      required String description,
      required int sellerID,
      required List<int> attachmentIDS,
      required List<dynamic> productDTOS}) async {
    final newProduct = ProductModel(
        productName: productName,
        price: price,
        productCategory: productCategoryID,
        availability: availability,
        payType: payType,
        conditionProduct: conditionProduct,
        description: description,
        sellerId: sellerID,
        attachmentIds: attachmentIDS,
        productFeaturesDtos:
            productDTOS.isNotEmpty ? productDTOS : [] // Ensure this is correct
        );

    // String response = await GetCategoriesService.createProduct(
    //     GetCategoriesService.apiAddNewProductAPI,
    //     productModelToJson(newProduct));
    // state = response;
    // print(state);
    String jsonToSend = productModelToJson(newProduct);
    l.i("JSON to send: $jsonToSend");
    l.i(jsonToSend); // This will help you verify the JSON structure
    String response = await GetCategoriesService.createProduct(
        GetCategoriesService.apiAddNewProductAPI, jsonToSend);
    state = response;
    l.i("$state");
  }
}
