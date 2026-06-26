import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/favorites/bloc/favorites_state.dart';
import 'package:my_shop/shared/base/base.dart';

class FavoritesCubit extends Cubit<FavoritesState> with ProductActionsMixin<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState()) {
    listenProductUpdates();
  }

  final _repository = getIt.get<ProductRepository>();

  @override
  ProductRepository get productRepository => _repository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final favorites = await productRepository.getFavorites();
    emit(state.copyWith(favorites: favorites, isLoading: false));
  }

  @override
  void onProductUpdated(Product updatedProduct) {
    if (updatedProduct.isFavorite != true) {
      emit(state.copyWith(favorites: state.favorites.removeById(updatedProduct.id)));
      return;
    }

    final hasProduct = state.favorites.any((favorite) => favorite.id == updatedProduct.id);
    final favorites = hasProduct ? state.favorites.replaceById(updatedProduct) : [...state.favorites, updatedProduct];

    emit(state.copyWith(favorites: favorites));
  }
}
