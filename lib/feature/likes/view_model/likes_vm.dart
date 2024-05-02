import 'package:dsd/data/entities/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final likedProductsProvider =
    StateNotifierProvider<LikedProductsNotifier, List<Product>>((ref) {
  return LikedProductsNotifier([]);
});

class LikedProductsNotifier extends StateNotifier<List<Product>> {
  LikedProductsNotifier(super.state);

  void addToLikedProducts(Product product) {
    state = [...state, product];
  }

  void removeFromLikedProducts(Product product) {
    state = state.where((p) => p != product).toList();
  }
}
