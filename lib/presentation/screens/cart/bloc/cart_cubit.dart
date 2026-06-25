import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/domain/entities/cart_item.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  final _repository = getIt.get<ProductRepository>();

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
      _emitCart(
        state.cartItems
            .where((item) => item.product?.id != cartItem.product?.id)
            .toList(growable: false),
      );
      return;
    }
    _replaceItem(updatedItem);
  }

  void cityChanged(String value) {
    _emitAddress(state.copyWith(city: value));
  }

  void streetChanged(String value) {
    _emitAddress(state.copyWith(street: value));
  }

  void houseChanged(String value) {
    _emitAddress(state.copyWith(house: value));
  }

  void apartmentChanged(String value) {
    _emitAddress(state.copyWith(apartment: value));
  }

  void indexChanged(String value) {
    emit(state.copyWith(postalCode: value));
  }

  void checkout() {
    _repository.clearCart();
    _emitCart(const []);
  }

  void _replaceItem(CartItem updatedItem) {
    _emitCart(
      state.cartItems
          .map(
            (item) => item.product?.id == updatedItem.product?.id
                ? updatedItem
                : item,
          )
          .toList(growable: false),
    );
  }

  void _emitCart(List<CartItem> cartItems, {bool? isLoading}) {
    emit(
      state.copyWith(
        cartItems: cartItems,
        isLoading: isLoading ?? state.isLoading,
        totalPrice: cartItems.fold<int>(
          0,
          (total, item) => total + item.totalPrice,
        ),
        isCheckoutEnabled:
            cartItems.isNotEmpty && _areRequiredAddressFieldsFilled(state),
      ),
    );
  }

  void _emitAddress(CartState updatedState) {
    emit(
      updatedState.copyWith(
        isCheckoutEnabled:
            updatedState.cartItems.isNotEmpty &&
            _areRequiredAddressFieldsFilled(updatedState),
      ),
    );
  }

  bool _areRequiredAddressFieldsFilled(CartState state) {
    return state.city.trim().isNotEmpty &&
        state.street.trim().isNotEmpty &&
        state.house.trim().isNotEmpty &&
        state.apartment.trim().isNotEmpty;
  }
}
