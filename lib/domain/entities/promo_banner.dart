import 'package:dart_mappable/dart_mappable.dart';

part 'promo_banner.mapper.dart';

@MappableClass()
class PromoBanner with PromoBannerMappable {
  const PromoBanner({this.id, this.titleKey, this.subtitleKey, this.imageUrl});

  final String? id;
  final String? titleKey;
  final String? subtitleKey;
  final String? imageUrl;
}
