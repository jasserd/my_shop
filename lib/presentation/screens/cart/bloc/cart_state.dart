import 'package:dart_mappable/dart_mappable.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/domain/entities/cart_item.dart';

part 'cart_state.mapper.dart';

@MappableClass()
class CartState with CartStateMappable {
  const CartState({
    this.cartItems = const [],
    this.isLoading = true,
    this.totalPrice = 0,
    this.isCheckoutEnabled = false,
    this.city = AppSettings.emptyString,
    this.street = AppSettings.emptyString,
    this.house = AppSettings.emptyString,
    this.apartment = AppSettings.emptyString,
    this.postalCode = AppSettings.emptyString,
  });

  final List<CartItem> cartItems;
  final bool isLoading;
  final int totalPrice;
  final bool isCheckoutEnabled;
  final String city;
  final String street;
  final String house;
  final String apartment;
  final String postalCode;
}
