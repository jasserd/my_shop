import 'package:dart_mappable/dart_mappable.dart';

part 'product.mapper.dart';

@MappableClass()
class Product with ProductMappable {
  const Product({
    required this.id,
    required this.titleKey,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
    this.isInCart = false,
  });

  factory Product.fromJson(Map<String, Object?> json) {
    return ProductMapper.fromMap(Map<String, dynamic>.from(json));
  }

  final String id;
  final String titleKey;
  final String imageUrl;
  final int price;
  final bool isFavorite;
  final bool isInCart;
}
