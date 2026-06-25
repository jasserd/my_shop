import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/home/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final _repository = getIt.get<ProductRepository>();

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final data = await _repository.getHome();
    emit(
      state.copyWith(
        stories: data.stories,
        banners: data.banners,
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
