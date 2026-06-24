import 'package:dart_mappable/dart_mappable.dart';
import 'package:my_shop/domain/entities/category.dart';
import 'package:my_shop/domain/entities/product.dart';

part 'catalog_state.mapper.dart';

@MappableEnum()
enum CatalogSortType {
  none,
  priceAscending,
  priceDescending,
  alphabetAscending,
  alphabetDescending,
}

@MappableClass()
class CategoryState with CategoryStateMappable {
  const CategoryState({
    this.products = const [],
    this.allProducts = const [],
    this.sortType = CatalogSortType.none,
    this.isLoading = true,
  });

  final List<Product> products;
  final List<Product> allProducts;
  final CatalogSortType sortType;
  final bool isLoading;
}

@MappableClass()
class CatalogState with CatalogStateMappable {
  const CatalogState({
    this.isLoading = true,
    this.categories = const [],
    this.categoryStates = const {},
  });

  final bool isLoading;
  final List<Category> categories;
  final Map<String, CategoryState> categoryStates;
}
