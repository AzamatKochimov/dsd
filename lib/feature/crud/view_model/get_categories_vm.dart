import 'package:dsd/feature/crud/presentation/pages/create_part/extra_later_will_be_deleted/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category_model.dart';
import '../services/get_categories_service.dart';

final getCategoriesProvider = FutureProvider<List<Categories>>((ref) async {
  List<Categories> categories = await GetCategoriesService.fetchAllData(
      GetCategoriesService.apiGetAllCategoryList);
  return categories;
});
