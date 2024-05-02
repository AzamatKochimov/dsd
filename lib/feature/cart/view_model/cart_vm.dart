import 'package:dsd/feature/crud/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addedToCartProvider =
    StateNotifierProvider<AddedToCartProvider, List<ProductModel>>((ref) {
  return AddedToCartProvider([]);
});

class AddedToCartProvider extends StateNotifier<List<ProductModel>> {
  AddedToCartProvider(super.state);

  void addToCartProvider(ProductModel product) {
    state = [...state, product];
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
    }
  }
}
