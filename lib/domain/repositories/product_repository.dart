import 'package:injectable/injectable.dart';
import 'package:my_shop/data/api/product_mock_api.dart';
import 'package:my_shop/domain/entities/cart_item.dart';
import 'package:my_shop/domain/entities/category.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/entities/story.dart';

@lazySingleton
class ProductRepository {
  ProductRepository(this._api);

  final ProductMockApi _api;
  final Map<String, bool> _favoriteOverrides = {};
  final Map<String, bool> _cartOverrides = {};
  final Map<String, int> _cartQuantities = {'product-1': 1, 'product-4': 2};
  final Map<String, Product> _addedCartProducts = {};

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

  Future<List<Category>> getCategories() {
    return _api.getCategories();
  }

  Future<List<Product>> getCategoryProducts(String categoryId) async {
    final products = await _api.getCategoryProducts(categoryId);
    return products.map(_applyOverrides).toList(growable: false);
  }

  Future<List<CartItem>> getCartItems() async {
    final response = await _api.getHome();
    final homeProducts = response.products.map(_applyOverrides);
    final products = {
      for (final product in homeProducts)
        if (product.isInCart) product.id: product,
      for (final product in _addedCartProducts.values)
        if (_cartOverrides[product.id] ?? product.isInCart)
          product.id: _applyOverrides(product),
    };

    return products.values
        .map(
          (product) => CartItem(
            product: product,
            quantity: _cartQuantities[product.id] ?? 1,
          ),
        )
        .toList(growable: false);
  }

  Product toggleFavorite(Product product) {
    final updatedProduct = product.copyWith(isFavorite: !product.isFavorite);
    _favoriteOverrides[product.id] = updatedProduct.isFavorite;
    return updatedProduct;
  }

  Product toggleCart(Product product) {
    final updatedProduct = product.copyWith(isInCart: !product.isInCart);
    _cartOverrides[product.id] = updatedProduct.isInCart;
    if (updatedProduct.isInCart) {
      _cartQuantities.putIfAbsent(product.id, () => 1);
      _addedCartProducts[product.id] = updatedProduct;
    } else {
      _cartQuantities.remove(product.id);
      _addedCartProducts.remove(product.id);
    }
    return updatedProduct;
  }

  CartItem incrementCartItem(CartItem cartItem) {
    final quantity = cartItem.quantity + 1;
    _cartQuantities[cartItem.product.id] = quantity;
    return cartItem.copyWith(quantity: quantity);
  }

  CartItem? decrementCartItem(CartItem cartItem) {
    final quantity = cartItem.quantity - 1;
    if (quantity <= 0) {
      _cartQuantities.remove(cartItem.product.id);
      _cartOverrides[cartItem.product.id] = false;
      _addedCartProducts.remove(cartItem.product.id);
      return null;
    }

    _cartQuantities[cartItem.product.id] = quantity;
    return cartItem.copyWith(quantity: quantity);
  }

  void clearCart() {
    for (final productId in _cartQuantities.keys) {
      _cartOverrides[productId] = false;
    }
    _cartQuantities.clear();
    _addedCartProducts.clear();
  }

  Product _applyOverrides(Product product) {
    return product.copyWith(
      isFavorite: _favoriteOverrides[product.id] ?? product.isFavorite,
      isInCart: _cartOverrides[product.id] ?? product.isInCart,
    );
  }
}
