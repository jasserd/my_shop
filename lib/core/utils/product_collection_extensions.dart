import 'package:my_shop/domain/entities/product.dart';

extension ProductCollectionExtensions on Iterable<Product> {
  List<Product> replaceById(Product updatedProduct) {
    return map(
      (product) => product.id == updatedProduct.id ? updatedProduct : product,
    ).toList(growable: false);
  }

  List<Product> removeById(String? productId) {
    return where((product) => product.id != productId).toList(growable: false);
  }
}
