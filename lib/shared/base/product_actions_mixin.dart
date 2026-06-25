import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';

enum ProductAction { favorite, cart }

mixin ProductActionsMixin<State> on Cubit<State> {
  ProductRepository get productRepository;

  void toggleFavorite(Product product, {String? scopeId}) {
    final updatedProduct = productRepository.toggleFavorite(product);
    onProductAction(
      updatedProduct,
      action: ProductAction.favorite,
      scopeId: scopeId,
    );
  }

  void toggleCart(Product product, {String? scopeId}) {
    final updatedProduct = productRepository.toggleCart(product);
    onProductAction(
      updatedProduct,
      action: ProductAction.cart,
      scopeId: scopeId,
    );
  }

  void onProductAction(
    Product updatedProduct, {
    required ProductAction action,
    String? scopeId,
  });
}
