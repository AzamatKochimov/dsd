import 'package:dsd/data/entities/product_model_sardor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final likedProductsProvider =
    StateNotifierProvider<LikedProductsNotifier, List<ProductModelSardor>>((ref) {
  return LikedProductsNotifier([]);
});

class LikedProductsNotifier extends StateNotifier<List<ProductModelSardor>> {
  LikedProductsNotifier(super.state);

  void addToLikedProducts(ProductModelSardor product) {
    state = [...state, product];
  }

  void removeFromLikedProducts(ProductModelSardor product) {
    state = state.where((p) => p != product).toList();
  }
}
