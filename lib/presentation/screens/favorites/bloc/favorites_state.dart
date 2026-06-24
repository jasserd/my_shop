import 'package:dart_mappable/dart_mappable.dart';
import 'package:my_shop/domain/entities/product.dart';

part 'favorites_state.mapper.dart';

@MappableClass()
class FavoritesState with FavoritesStateMappable {
  const FavoritesState({this.favorites = const [], this.isLoading = true});

  final List<Product> favorites;
  final bool isLoading;
}
