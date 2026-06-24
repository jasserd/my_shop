import 'package:dart_mappable/dart_mappable.dart';

part 'story.mapper.dart';

@MappableClass()
class Story with StoryMappable {
  const Story({
    required this.id,
    required this.titleKey,
    required this.imageUrl,
    this.isViewed = false,
  });

  final String id;
  final String titleKey;
  final String imageUrl;
  final bool isViewed;
}
