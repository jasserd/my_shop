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
      spacing: AppSizes.spacingMd,
      crossAxisAlignment: .start,
      children: [
        AppText(localizations.deliveryAddressTitle, style: AppTextStyles.h2()),
        AppTextField(
          label: localizations.cityLabel,
          hint: localizations.cityHint,
          onChanged: cartCubit.cityChanged,
        ),
        AppTextField(
          label: localizations.streetLabel,
          hint: localizations.streetHint,
          onChanged: cartCubit.streetChanged,
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
                onChanged: cartCubit.houseChanged,
              ),
            ),
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
