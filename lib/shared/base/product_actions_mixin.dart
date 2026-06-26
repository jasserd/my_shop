import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/event_bus/event_bus.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';

mixin ProductActionsMixin<State> on Cubit<State> {
  StreamSubscription<ProductUpdatedEvent>? _productUpdatesSubscription;

  ProductRepository get productRepository;

  void listenProductUpdates() {
    _productUpdatesSubscription = appEventBus.on<ProductUpdatedEvent>().listen(
      (event) => onProductUpdated(event.product),
    );
  }

  void toggleFavorite(Product product, {String? scopeId}) {
    final updatedProduct = productRepository.toggleFavorite(product);
    appEventBus.publish(ProductUpdatedEvent(updatedProduct));
  }

  void toggleCart(Product product, {String? scopeId}) {
    final updatedProduct = productRepository.toggleCart(product);
    appEventBus.publish(ProductUpdatedEvent(updatedProduct));
  }

  void onProductUpdated(Product updatedProduct);

  @override
  Future<void> close() async {
    await _productUpdatesSubscription?.cancel();
    return super.close();
  }
}
