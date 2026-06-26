import 'package:my_shop/domain/entities/product.dart';

class ProductUpdatedEvent {
  const ProductUpdatedEvent(this.product);

  final Product product;
}
