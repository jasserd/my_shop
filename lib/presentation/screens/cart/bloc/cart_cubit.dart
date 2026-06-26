import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/core/event_bus/event_bus.dart';
import 'package:my_shop/domain/entities/cart_item.dart';
import 'package:my_shop/domain/entities/delivery_address.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState()) {
    _productUpdatesSubscription = appEventBus.on<ProductUpdatedEvent>().listen(
      (event) => _onProductUpdated(event.product),
    );
  }

  final _repository = getIt.get<ProductRepository>();
  late final StreamSubscription<ProductUpdatedEvent> _productUpdatesSubscription;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final cartItems = await _repository.getCartItems();
    _emitCart(cartItems, isLoading: false);
  }

  void increment(CartItem cartItem) {
    final updatedItem = _repository.incrementCartItem(cartItem);
    _replaceItem(updatedItem);
  }

  void decrement(CartItem cartItem) {
    final updatedItem = _repository.decrementCartItem(cartItem);
    if (updatedItem == null) {
      final product = cartItem.product;
      if (product != null) {
        appEventBus.publish(ProductUpdatedEvent(product.copyWith(isInCart: false)));
      }
      _emitCart(state.cartItems.where((item) => item.product?.id != cartItem.product?.id).toList(growable: false));
      return;
    }
    _replaceItem(updatedItem);
  }

  void deliveryAddressChanged(DeliveryAddress deliveryAddress) {
    emit(
      state.copyWith(
        deliveryAddress: deliveryAddress,
        isCheckoutEnabled: state.cartItems.isNotEmpty && deliveryAddress.areRequiredFieldsFilled,
      ),
    );
  }

  void checkout() {
    for (final cartItem in state.cartItems) {
      final product = cartItem.product;
      if (product != null) {
        appEventBus.publish(ProductUpdatedEvent(product.copyWith(isInCart: false)));
      }
    }
    _repository.clearCart();
    _emitCart(const []);
  }

  void _replaceItem(CartItem updatedItem) {
    _emitCart(
      state.cartItems
          .map((item) => item.product?.id == updatedItem.product?.id ? updatedItem : item)
          .toList(growable: false),
    );
  }

  void _emitCart(List<CartItem> cartItems, {bool? isLoading}) {
    emit(
      state.copyWith(
        cartItems: cartItems,
        isLoading: isLoading ?? state.isLoading,
        totalPrice: cartItems.fold<int>(0, (total, item) => total + item.totalPrice),
        isCheckoutEnabled: cartItems.isNotEmpty && state.deliveryAddress.areRequiredFieldsFilled,
      ),
    );
  }

  Future<void> _onProductUpdated(Product updatedProduct) async {
    if (updatedProduct.isInCart == null) {
      return;
    }

    final cartItems = await _repository.getCartItems();
    if (isClosed) {
      return;
    }

    _emitCart(cartItems);
  }

  @override
  Future<void> close() async {
    await _productUpdatesSubscription.cancel();
    return super.close();
  }
}
