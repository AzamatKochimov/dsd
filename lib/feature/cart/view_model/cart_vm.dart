import 'package:dsd/data/entities/product_model_sardor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addedToCartProvider =
    StateNotifierProvider<AddedToCartProvider, List<ProductModelSardor>>((ref) {
  return AddedToCartProvider([]);
});

class AddedToCartProvider extends StateNotifier<List<ProductModelSardor>> {
  AddedToCartProvider(super.state);

  void addToCartProvider(ProductModelSardor product) {
    state = [...state, product];
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
    }
  }
}
