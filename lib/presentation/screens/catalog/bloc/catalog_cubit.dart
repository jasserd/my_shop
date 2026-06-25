import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/catalog/bloc/catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(const CatalogState());

  final _repository = getIt.get<ProductRepository>();

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final categories = await _repository.getCategories();
    emit(state.copyWith(isLoading: false, categories: categories));
  }

  Future<void> toggleCategory(String categoryId) async {
    final categoryStates = state.categoryStates;
    if (categoryStates.containsKey(categoryId)) {
      _emitCategoryStates({...categoryStates}..remove(categoryId));
      return;
    }

    _emitCategoryStates({...categoryStates, categoryId: const CategoryState()});

    final products = await _repository.getCategoryProducts(categoryId);
    if (state.categoryStates.containsKey(categoryId) == false) {
      return;
    }

    _updateCategory(
      categoryId,
      (categoryState) => categoryState.copyWith(
        products: products,
        allProducts: products,
        isLoading: false,
      ),
    );
  }

  void togglePriceSort(String categoryId) {
    final currentSort = state.categoryStates[categoryId]?.sortType;
    final nextSort = currentSort == CatalogSortType.priceAscending
        ? CatalogSortType.priceDescending
        : CatalogSortType.priceAscending;
    _setSort(categoryId, nextSort);
  }

  void toggleAlphabetSort(String categoryId) {
    final currentSort = state.categoryStates[categoryId]?.sortType;
    final nextSort = currentSort == CatalogSortType.alphabetAscending
        ? CatalogSortType.alphabetDescending
        : CatalogSortType.alphabetAscending;
    _setSort(categoryId, nextSort);
  }

  void _setSort(String categoryId, CatalogSortType sortType) {
    _updateCategory(categoryId, (categoryState) {
      final products = switch (sortType) {
        CatalogSortType.none => categoryState.allProducts,
        CatalogSortType.priceAscending => [
          ...categoryState.allProducts,
        ]..sortBy((product) => product.price ?? 0),
        CatalogSortType.priceDescending =>
          ([...categoryState.allProducts]
                ..sortBy((product) => product.price ?? 0))
              .reversed
              .toList(growable: false),
        CatalogSortType.alphabetAscending => [
          ...categoryState.allProducts,
        ]..sortBy((product) => product.titleKey ?? AppSettings.emptyString),
        CatalogSortType.alphabetDescending =>
          ([...categoryState.allProducts]..sortBy(
                (product) => product.titleKey ?? AppSettings.emptyString,
              ))
              .reversed
              .toList(growable: false),
      };

      return categoryState.copyWith(products: products, sortType: sortType);
    });
  }

  void toggleFavorite(String categoryId, Product product) {
    final updatedProduct = _repository.toggleFavorite(product);
    _replaceProduct(categoryId, updatedProduct);
  }

  void toggleCart(String categoryId, Product product) {
    final updatedProduct = _repository.toggleCart(product);
    _replaceProduct(categoryId, updatedProduct);
  }

  void _replaceProduct(String categoryId, Product updatedProduct) {
    _updateCategory(categoryId, (categoryState) {
      List<Product> replace(List<Product> products) {
        return products
            .map(
              (product) =>
                  product.id == updatedProduct.id ? updatedProduct : product,
            )
            .toList(growable: false);
      }

      return categoryState.copyWith(
        products: replace(categoryState.products),
        allProducts: replace(categoryState.allProducts),
      );
    });
  }

  void _updateCategory(
    String categoryId,
    CategoryState Function(CategoryState categoryState) update,
  ) {
    final categoryState = state.categoryStates[categoryId];
    if (categoryState == null) {
      return;
    }

    _emitCategoryStates({
      ...state.categoryStates,
      categoryId: update(categoryState),
    });
  }

  void _emitCategoryStates(Map<String, CategoryState> categoryStates) {
    emit(state.copyWith(categoryStates: categoryStates));
  }
}
