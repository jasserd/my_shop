import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/core/utils/utils.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/repositories/product_repository.dart';
import 'package:my_shop/presentation/screens/catalog/bloc/catalog_state.dart';
import 'package:my_shop/shared/base/base.dart';

class CatalogCubit extends Cubit<CatalogState> with ProductActionsMixin<CatalogState> {
  CatalogCubit() : super(const CatalogState()) {
    listenProductUpdates();
  }

  final _repository = getIt.get<ProductRepository>();

  @override
  ProductRepository get productRepository => _repository;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    final categories = await productRepository.getCategories();
    emit(state.copyWith(isLoading: false, categories: categories));
  }

  Future<void> toggleCategory(String categoryId) async {
    final categoryStates = state.categoryStates;
    if (categoryStates.containsKey(categoryId)) {
      _emitCategoryStates({...categoryStates}..remove(categoryId));
      return;
    }

    _emitCategoryStates({...categoryStates, categoryId: const CategoryState()});

    final products = await productRepository.getCategoryProducts(categoryId);
    if (!state.categoryStates.containsKey(categoryId)) {
      return;
    }

    _updateCategory(
      categoryId,
      (categoryState) => categoryState.copyWith(products: products, allProducts: products, isLoading: false),
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
        CatalogSortType.priceAscending => [...categoryState.allProducts]..sortBy((product) => product.price ?? 0),
        CatalogSortType.priceDescending => ([
          ...categoryState.allProducts,
        ]..sortBy((product) => product.price ?? 0)).reversed.toList(growable: false),
        CatalogSortType.alphabetAscending => [
          ...categoryState.allProducts,
        ]..sortBy((product) => product.titleKey ?? AppSettings.emptyString),
        CatalogSortType.alphabetDescending => ([
          ...categoryState.allProducts,
        ]..sortBy((product) => product.titleKey ?? AppSettings.emptyString)).reversed.toList(growable: false),
      };

      return categoryState.copyWith(products: products, sortType: sortType);
    });
  }

  @override
  void onProductUpdated(Product updatedProduct) {
    if (state.categoryStates.isEmpty) {
      return;
    }

    final categoryStates = <String, CategoryState>{};
    for (final entry in state.categoryStates.entries) {
      final categoryState = entry.value;
      categoryStates[entry.key] = categoryState.copyWith(
        products: categoryState.products.replaceById(updatedProduct),
        allProducts: categoryState.allProducts.replaceById(updatedProduct),
      );
    }

    _emitCategoryStates(categoryStates);
  }

  void _updateCategory(String categoryId, CategoryState Function(CategoryState categoryState) update) {
    final categoryState = state.categoryStates[categoryId];
    if (categoryState == null) {
      return;
    }

    _emitCategoryStates({...state.categoryStates, categoryId: update(categoryState)});
  }

  void _emitCategoryStates(Map<String, CategoryState> categoryStates) {
    emit(state.copyWith(categoryStates: categoryStates));
  }
}
