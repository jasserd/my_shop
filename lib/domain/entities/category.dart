import 'package:dart_mappable/dart_mappable.dart';

part 'category.mapper.dart';

@MappableEnum()
enum CategoryIcon { clothing, shoes, accessories, electronics, books, home }

@MappableClass()
class Category with CategoryMappable {
  const Category({
    required this.id,
    required this.titleKey,
    required this.icon,
  });

  factory Category.fromJson(Map<String, Object?> json) {
    return CategoryMapper.fromMap(Map<String, dynamic>.from(json));
  }

  final String id;
  final String titleKey;
  final CategoryIcon icon;
}
