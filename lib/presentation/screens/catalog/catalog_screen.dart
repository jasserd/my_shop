import 'package:flutter/material.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/presentation/screens/catalog/widgets/catalog_content.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          AppHeader(
            title: localizations.catalogTitle,
            actionIcon: Icons.person,
            actionTooltip: localizations.profileTooltip,
            onActionPressed: () {},
          ),
          const Expanded(child: CatalogContent()),
        ],
      ),
    );
  }
}
