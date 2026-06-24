import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/home/bloc/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(const HomeState());

  final ProductRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final data = await _repository.getHome();
    emit(
      state.copyWith(
        stories: data.stories,
        products: data.products,
        isLoading: false,
      ),
    );
  }

  void markStoryViewed(String storyId) {
    emit(
      state.copyWith(
        stories: state.stories
            .map(
              (story) =>
                  story.id == storyId ? story.copyWith(isViewed: true) : story,
            )
            .toList(growable: false),
      ),
    );
  }

  void toggleFavorite(String productId) {
    final product = state.products.firstWhere(
      (product) => product.id == productId,
    );
    final updatedProduct = _repository.toggleFavorite(product);
    _replaceProduct(updatedProduct);
  }

  void toggleCart(String productId) {
    final product = state.products.firstWhere(
      (product) => product.id == productId,
    );
    final updatedProduct = _repository.toggleCart(product);
    _replaceProduct(updatedProduct);
  }

  void _replaceProduct(Product updatedProduct) {
    emit(
      state.copyWith(
        products: state.products
            .map(
              (product) =>
                  product.id == updatedProduct.id ? updatedProduct : product,
            )
            .toList(growable: false),
      ),
    );
  }
}
