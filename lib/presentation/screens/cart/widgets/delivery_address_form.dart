import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/domain/entities/delivery_address.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class DeliveryAddressForm extends StatelessWidget {
  const DeliveryAddressForm({
    required this.deliveryAddress,
    required this.onChanged,
    super.key,
  });

  final DeliveryAddress deliveryAddress;
  final ValueChanged<DeliveryAddress> onChanged;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      spacing: AppSizes.spacingMd,
      crossAxisAlignment: .start,
      children: [
        AppText(localizations.deliveryAddressTitle, style: AppTextStyles.h2()),
        AppTextField(
          label: localizations.cityLabel,
          hint: localizations.cityHint,
          onChanged: (value) {
            onChanged(deliveryAddress.copyWith(city: value));
          },
        ),
        AppTextField(
          label: localizations.streetLabel,
          hint: localizations.streetHint,
          onChanged: (value) {
            onChanged(deliveryAddress.copyWith(street: value));
          },
        ),
        Row(
          spacing: AppSizes.spacingMd,
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: AppTextField(
                label: localizations.houseLabel,
                hint: localizations.houseHint,
                keyboardType: .number,
                onChanged: (value) {
                  onChanged(deliveryAddress.copyWith(house: value));
                },
              ),
            ),
            Expanded(
              child: AppTextField(
                label: localizations.apartmentLabel,
                hint: localizations.apartmentHint,
                keyboardType: .number,
                onChanged: (value) {
                  onChanged(deliveryAddress.copyWith(apartment: value));
                },
              ),
            ),
          ],
        ),
        AppTextField(
          label: localizations.postalCodeLabel,
          hint: localizations.postalCodeHint,
          keyboardType: .number,
          onChanged: (value) {
            onChanged(deliveryAddress.copyWith(postalCode: value));
          },
        ),
      ],
    );
  }
}
