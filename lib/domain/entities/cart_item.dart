import 'package:dart_mappable/dart_mappable.dart';
import 'package:my_shop/domain/entities/product.dart';

part 'cart_item.mapper.dart';

@MappableClass()
class CartItem with CartItemMappable {
  const CartItem({this.product, this.quantity});

  final Product? product;
  final int? quantity;

  int get totalPrice => (product?.price ?? 0) * (quantity ?? 0);
}
