import 'package:flutter/services.dart';
import 'package:my_shop/core/configs/configs.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';

enum PaymentStatus { success, failed }

class PaymentService {
  Future<PaymentStatus> pay({
    required int amount,
    required String title,
    required String subtitle,
  }) async {
    try {
      final charge = Amount(value: amount.toString(), currency: Currency.rub);
      final result = await YookassaPaymentsFlutter.tokenization(
        TokenizationModuleInputData(
          clientApplicationKey: YooKassaPaymentConfig.clientApplicationKey,
          title: title,
          subtitle: subtitle,
          amount: charge,
          shopId: YooKassaPaymentConfig.shopId,
          savePaymentMethod: SavePaymentMethod.off,
          testModeSettings: TestModeSettings(
            YooKassaPaymentConfig.paymentAuthorizationPassed,
            YooKassaPaymentConfig.testCardsCount,
            charge,
            YooKassaPaymentConfig.enablePaymentError,
          ),
          customizationSettings: const CustomizationSettings(
            AppColors.primary,
            false,
          ),
          tokenizationSettings: TokenizationSettings(
            PaymentMethodTypes.bankCard,
          ),
        ),
      );

      if (result is SuccessTokenizationResult) {
        return PaymentStatus.success;
      }

      return PaymentStatus.failed;
    } on PlatformException {
      return PaymentStatus.failed;
    }
  }
}
