import 'package:dsd/data/entities/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addedtoCartProvider =
    StateNotifierProvider<AddedtoCartProvider, List<Product>>((ref) {
  return AddedtoCartProvider([]);
});

class AddedtoCartProvider extends StateNotifier<List<Product>> {
  AddedtoCartProvider(super.state);

  void addToCartProvider(Product product) {
    state = [...state, product];
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
    }
  }
}
