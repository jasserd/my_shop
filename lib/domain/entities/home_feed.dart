import 'package:dart_mappable/dart_mappable.dart';
import 'package:my_shop/domain/entities/product.dart';
import 'package:my_shop/domain/entities/story.dart';

part 'home_feed.mapper.dart';

@MappableClass()
class HomeFeed with HomeFeedMappable {
  const HomeFeed({required this.stories, required this.products});

  factory HomeFeed.fromJson(Map<String, Object?> json) {
    return HomeFeedMapper.fromMap(Map<String, dynamic>.from(json));
  }

  final List<Story> stories;
  final List<Product> products;
}
