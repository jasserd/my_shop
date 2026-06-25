import 'package:dart_mappable/dart_mappable.dart';

part 'story.mapper.dart';

@MappableClass()
class Story with StoryMappable {
  const Story({this.id, this.titleKey, this.imageUrl, this.isViewed});

  final String? id;
  final String? titleKey;
  final String? imageUrl;
  final bool? isViewed;
}
