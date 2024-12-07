import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'cart_item.dart';

class CartState {
  final List<CartItem> items;
  final double total;

  CartState(this.items, this.total);
}

class CartCubit extends Cubit<CartState> {
  final Box<CartItem> cartBox;

  CartCubit(this.cartBox) : super(CartState(cartBox.values.toList(), 0)) {
    _calculateTotal();
  }

  void addToCart(CartItem item) {
    CartItem? existingItem;

    for (var cartItem in cartBox.values) {
      if (cartItem.title == item.title) {
        existingItem = cartItem;
        break;
      }
    }

    if (existingItem != null) {
      existingItem.quantity += 1;

      final existingItemKey = cartBox.keys.firstWhere(
        (key) => cartBox.get(key) == existingItem,
        orElse: () => null,
      );

      if (existingItemKey != null) {
        cartBox.put(existingItemKey, existingItem);
      }
    } else {
      cartBox.add(item);
    }

    emit(CartState(cartBox.values.toList(), _calculateTotal()));
  }

  void removeFromCart(CartItem item) {
    final itemKey = cartBox.keys.firstWhere(
      (key) => cartBox.get(key) == item,
      orElse: () => null,
    );

    if (itemKey != null) {
      cartBox.delete(itemKey);
      emit(CartState(cartBox.values.toList(), _calculateTotal()));
    }
  }

  double _calculateTotal() {
    return cartBox.values
        .fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
