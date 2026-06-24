import 'package:flutter/material.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_cubit.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class DeliveryAddressForm extends StatelessWidget {
  const DeliveryAddressForm({required this.cartCubit, super.key});

  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: .start,
      children: [
        AppText(localizations.deliveryAddressTitle, style: AppTextStyles.h2),
        const SizedBox(height: AppSizes.spacingMd),
        AppTextField(
          label: localizations.cityLabel,
          hint: localizations.cityHint,
          onChanged: cartCubit.cityChanged,
        ),
        const SizedBox(height: AppSizes.spacingMd),
        AppTextField(
          label: localizations.streetLabel,
          hint: localizations.streetHint,
          onChanged: cartCubit.streetChanged,
        ),
        const SizedBox(height: AppSizes.spacingMd),
        Row(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: AppTextField(
                label: localizations.houseLabel,
                hint: localizations.houseHint,
                keyboardType: .number,
                onChanged: cartCubit.houseChanged,
              ),
            ),
            const SizedBox(width: AppSizes.spacingMd),
            Expanded(
              child: AppTextField(
                label: localizations.apartmentLabel,
                hint: localizations.apartmentHint,
                keyboardType: .number,
                onChanged: cartCubit.apartmentChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.spacingMd),
        AppTextField(
          label: localizations.postalCodeLabel,
          hint: localizations.postalCodeHint,
          keyboardType: .number,
          onChanged: cartCubit.indexChanged,
        ),
      ],
    );
  }
}
