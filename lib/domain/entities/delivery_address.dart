import 'package:dart_mappable/dart_mappable.dart';

part 'delivery_address.mapper.dart';

@MappableClass()
class DeliveryAddress with DeliveryAddressMappable {
  const DeliveryAddress({
    this.city,
    this.street,
    this.house,
    this.apartment,
    this.postalCode,
  });

  final String? city;
  final String? street;
  final String? house;
  final String? apartment;
  final String? postalCode;

  bool get areRequiredFieldsFilled {
    return city?.trim().isNotEmpty == true &&
        street?.trim().isNotEmpty == true &&
        house?.trim().isNotEmpty == true &&
        apartment?.trim().isNotEmpty == true;
  }
}
