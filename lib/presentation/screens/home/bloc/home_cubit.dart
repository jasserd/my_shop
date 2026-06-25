import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/home/bloc/home_state.dart';
import 'package:my_shop/shared/base/base.dart';

class HomeCubit extends Cubit<HomeState> with ProductActionsMixin<HomeState> {
  HomeCubit() : super(const HomeState());

  final _repository = getIt.get<ProductRepository>();

  @override
  ProductRepository get productRepository => _repository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final data = await productRepository.getHome();
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

  @override
  void onProductAction(
    Product updatedProduct, {
    required ProductAction action,
    String? scopeId,
  }) {
    emit(state.copyWith(products: state.products.replaceById(updatedProduct)));
  }
}
