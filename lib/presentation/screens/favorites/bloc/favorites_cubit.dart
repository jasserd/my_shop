import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/favorites/bloc/favorites_state.dart';
import 'package:my_shop/shared/base/base.dart';

class FavoritesCubit extends Cubit<FavoritesState>
    with ProductActionsMixin<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  final _repository = getIt.get<ProductRepository>();

  @override
  ProductRepository get productRepository => _repository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final favorites = await productRepository.getFavorites();
    emit(state.copyWith(favorites: favorites, isLoading: false));
  }

  @override
  void onProductAction(
    Product updatedProduct, {
    required ProductAction action,
    String? scopeId,
  }) {
    final favorites = switch (action) {
      ProductAction.favorite => state.favorites.removeById(updatedProduct.id),
      ProductAction.cart => state.favorites.replaceById(updatedProduct),
    };

    emit(state.copyWith(favorites: favorites));
  }
}
