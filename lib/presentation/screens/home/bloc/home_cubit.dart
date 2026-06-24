import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/entities/story.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';

part 'home_cubit.mapper.dart';

@MappableClass()
class HomeState with HomeStateMappable {
  const HomeState({
    this.stories = const [],
    this.products = const [],
    this.isLoading = true,
  });

  final List<Story> stories;
  final List<Product> products;
  final bool isLoading;
}

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
    _updateProduct(
      productId,
      (product) => product.copyWith(isFavorite: !product.isFavorite),
    );
  }

  void toggleCart(String productId) {
    _updateProduct(
      productId,
      (product) => product.copyWith(isInCart: !product.isInCart),
    );
  }

  void _updateProduct(
    String productId,
    Product Function(Product product) update,
  ) {
    emit(
      state.copyWith(
        products: state.products
            .map(
              (product) => product.id == productId ? update(product) : product,
            )
            .toList(growable: false),
      ),
    );
  }
}
