import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/domain/entities/cart_item.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._repository) : super(const CartState());

  final ProductRepository _repository;

  String _city = AppSettings.emptyString;
  String _street = AppSettings.emptyString;
  String _house = AppSettings.emptyString;
  String _apartment = AppSettings.emptyString;

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
            .where((item) => item.product.id != cartItem.product.id)
            .toList(growable: false),
      );
      return;
    }
    _replaceItem(updatedItem);
  }

  void cityChanged(String value) {
    _city = value;
    _emitCheckoutAvailability();
  }

  void streetChanged(String value) {
    _street = value;
    _emitCheckoutAvailability();
  }

  void houseChanged(String value) {
    _house = value;
    _emitCheckoutAvailability();
  }

  void apartmentChanged(String value) {
    _apartment = value;
    _emitCheckoutAvailability();
  }

  void indexChanged(String _) {}

  void checkout() {
    _repository.clearCart();
    _emitCart(const []);
  }

  void _replaceItem(CartItem updatedItem) {
    _emitCart(
      state.cartItems
          .map(
            (item) =>
                item.product.id == updatedItem.product.id ? updatedItem : item,
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
            cartItems.isNotEmpty && _areRequiredAddressFieldsFilled,
      ),
    );
  }

  void _emitCheckoutAvailability() {
    emit(
      state.copyWith(
        isCheckoutEnabled:
            state.cartItems.isNotEmpty && _areRequiredAddressFieldsFilled,
      ),
    );
  }

  bool get _areRequiredAddressFieldsFilled =>
      _city.trim().isNotEmpty &&
      _street.trim().isNotEmpty &&
      _house.trim().isNotEmpty &&
      _apartment.trim().isNotEmpty;
}
