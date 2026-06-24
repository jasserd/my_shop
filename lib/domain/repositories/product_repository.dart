import 'package:injectable/injectable.dart';
import 'package:my_shop/data/api/product_mock_api.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/entities/story.dart';

@lazySingleton
class ProductRepository {
  ProductRepository(this._api);

  final ProductMockApi _api;
  final Map<String, bool> _favoriteOverrides = {};
  final Map<String, bool> _cartOverrides = {};

  Future<({List<Story> stories, List<Product> products})> getHome() async {
    final response = await _api.getHome();

    return (
      stories: response.stories,
      products: response.products.map(_applyOverrides).toList(growable: false),
    );
  }

  Future<List<Product>> getFavorites() async {
    final response = await _api.getHome();

    return List.unmodifiable(
      response.products
          .map(_applyOverrides)
          .where((product) => product.isFavorite),
    );
  }

  Product toggleFavorite(Product product) {
    final updatedProduct = product.copyWith(isFavorite: !product.isFavorite);
    _favoriteOverrides[product.id] = updatedProduct.isFavorite;
    return updatedProduct;
  }

  Product toggleCart(Product product) {
    final updatedProduct = product.copyWith(isInCart: !product.isInCart);
    _cartOverrides[product.id] = updatedProduct.isInCart;
    return updatedProduct;
  }

  Product _applyOverrides(Product product) {
    return product.copyWith(
      isFavorite: _favoriteOverrides[product.id] ?? product.isFavorite,
      isInCart: _cartOverrides[product.id] ?? product.isInCart,
    );
  }
}
