import 'package:injectable/injectable.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/data/api/product_mock_api.dart';
import 'package:my_shop/domain/entities/cart_item.dart';
import 'package:my_shop/domain/entities/category.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/entities/promo_banner.dart';
import 'package:my_shop/domain/entities/story.dart';

@lazySingleton
class ProductRepository {
  ProductRepository(this._api);

  final ProductMockApi _api;
  final _favoriteOverrides = <String, bool>{};
  final _cartOverrides = <String, bool>{};
  final _cartQuantities = <String, int>{
    MockDataConstants.initialCartFirstProductId:
        MockDataConstants.initialCartFirstQuantity,
    MockDataConstants.initialCartSecondProductId:
        MockDataConstants.initialCartSecondQuantity,
  };
  final _addedCartProducts = <String, Product>{};

  Future<
    ({List<Story> stories, List<PromoBanner> banners, List<Product> products})
  >
  getHome() async {
    final response = await _api.getHome();

    return (
      stories: response.stories ?? const [],
      banners: response.banners ?? const [],
      products: (response.products ?? const [])
          .map(_applyOverrides)
          .toList(growable: false),
    );
  }

  Future<List<Product>> getFavorites() async {
    final response = await _api.getHome();

    return List.unmodifiable(
      response.products
              ?.map(_applyOverrides)
              .where((product) => product.isFavorite == true) ??
          const [],
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
    final homeProducts = (response.products ?? const []).map(_applyOverrides);
    final products = <String, Product>{};

    for (final product in homeProducts) {
      if (product.isInCart == true) {
        products[product.id ?? AppSettings.emptyString] = product;
      }
    }

    for (final product in _addedCartProducts.values) {
      if (_cartOverrides[product.id] ?? product.isInCart ?? false) {
        products[product.id ?? AppSettings.emptyString] = _applyOverrides(
          product,
        );
      }
    }

    return products.values
        .map(
          (product) => CartItem(
            product: product,
            quantity:
                _cartQuantities[product.id] ?? AppSettings.defaultCartQuantity,
          ),
        )
        .toList(growable: false);
  }

  Product toggleFavorite(Product product) {
    final productId = product.id ?? AppSettings.emptyString;
    final updatedProduct = product.copyWith(
      isFavorite: product.isFavorite != true,
    );
    _favoriteOverrides[productId] = updatedProduct.isFavorite ?? false;
    return updatedProduct;
  }

  Product toggleCart(Product product) {
    final productId = product.id ?? AppSettings.emptyString;
    final updatedProduct = product.copyWith(isInCart: product.isInCart != true);
    _cartOverrides[productId] = updatedProduct.isInCart ?? false;
    if (updatedProduct.isInCart == true) {
      _cartQuantities.putIfAbsent(
        productId,
        () => AppSettings.defaultCartQuantity,
      );
      _addedCartProducts[productId] = updatedProduct;
    } else {
      _cartQuantities.remove(productId);
      _addedCartProducts.remove(productId);
    }
    return updatedProduct;
  }

  CartItem incrementCartItem(CartItem cartItem) {
    final productId = cartItem.product?.id ?? AppSettings.emptyString;
    final quantity = (cartItem.quantity ?? 0) + AppSettings.defaultCartQuantity;
    _cartQuantities[productId] = quantity;
    return cartItem.copyWith(quantity: quantity);
  }

  CartItem? decrementCartItem(CartItem cartItem) {
    final productId = cartItem.product?.id ?? AppSettings.emptyString;
    final quantity = (cartItem.quantity ?? 0) - AppSettings.defaultCartQuantity;
    if (quantity <= AppSettings.minimumCartQuantity) {
      _cartQuantities.remove(productId);
      _cartOverrides[productId] = false;
      _addedCartProducts.remove(productId);
      return null;
    }

    _cartQuantities[productId] = quantity;
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
    final productId = product.id ?? AppSettings.emptyString;
    return product.copyWith(
      isFavorite: _favoriteOverrides[productId] ?? product.isFavorite ?? false,
      isInCart: _cartOverrides[productId] ?? product.isInCart ?? false,
    );
  }
}
