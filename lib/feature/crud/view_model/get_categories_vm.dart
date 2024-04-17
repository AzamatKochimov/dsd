import 'package:dsd/feature/crud/presentation/pages/create_part/extra_later_will_be_deleted/model.dart';
import 'package:dsd/feature/crud/presentation/pages/create_part/services/get_categories_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCategoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  List<CategoryModel> categories = await GetCategoriesService.fetchAllExam(
      GetCategoriesService.apiGetAllData);
  return categories;
});
