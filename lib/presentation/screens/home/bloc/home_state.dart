import 'package:dart_mappable/dart_mappable.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/entities/promo_banner.dart';
import 'package:my_shop/domain/entities/story.dart';

part 'home_state.mapper.dart';

@MappableClass()
class HomeState with HomeStateMappable {
  const HomeState({
    this.stories = const [],
    this.banners = const [],
    this.products = const [],
    this.isLoading = true,
  });

  final List<Story> stories;
  final List<PromoBanner> banners;
  final List<Product> products;
  final bool isLoading;
}
