import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/favorites/bloc/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  final _repository = getIt.get<ProductRepository>();

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final favorites = await _repository.getFavorites();
    emit(state.copyWith(favorites: favorites, isLoading: false));
  }

  void removeFromFavorites(Product product) {
    _repository.toggleFavorite(product);
    emit(
      state.copyWith(
        favorites: state.favorites
            .where((favorite) => favorite.id != product.id)
            .toList(growable: false),
      ),
    );
  }

  void toggleCart(Product product) {
    final updatedProduct = _repository.toggleCart(product);
    emit(
      state.copyWith(
        favorites: state.favorites
            .map(
              (favorite) =>
                  favorite.id == product.id ? updatedProduct : favorite,
            )
            .toList(growable: false),
      ),
    );
  }
}
