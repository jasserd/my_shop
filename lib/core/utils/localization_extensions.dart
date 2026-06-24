import 'package:my_shop/core/l10n/app_localizations.dart';

extension AppLocalizationsKey on AppLocalizations {
  String byKey(String key) => switch (key) {
    'storyNew' => storyNew,
    'storyDecor' => storyDecor,
    'storyAccessories' => storyAccessories,
    'storyCare' => storyCare,
    'productLamp' => productLamp,
    'productCandle' => productCandle,
    'productLinen' => productLinen,
    'productBowl' => productBowl,
    'productVase' => productVase,
    'productChair' => productChair,
    'productPerfume' => productPerfume,
    'productDecor' => productDecor,
    _ => key,
  };
}
