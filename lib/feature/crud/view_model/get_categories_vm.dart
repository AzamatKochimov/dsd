import 'package:dsd/data/entities/product_model_sardor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category_model.dart';
import '../services/get_categories_service.dart';

final getCategoriesProvider = FutureProvider<List<Categories>>((ref) async {
  List<Categories> categories = await GetCategoriesService.fetchAllData(
      GetCategoriesService.apiGetAllCategoryList);
  return categories;
});

final getActiveProducts = FutureProvider<List<ProductModelSardor>>((ref) async{
  List<ProductModelSardor> products = await GetCategoriesService.getActiveProducts(
      GetCategoriesService.apiGetActiveProducts);
  return products;
} );
