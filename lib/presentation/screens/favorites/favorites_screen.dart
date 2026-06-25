import 'package:flutter/material.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/presentation/screens/favorites/widgets/favorites_content.dart';
import 'package:my_shop/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          AppHeader(
            title: localizations.favoritesTitle,
            actionIcon: Icons.person,
            actionTooltip: localizations.profileTooltip,
            onActionPressed: () {},
          ),
          const Expanded(child: FavoritesContent()),
        ],
      ),
    );
  }
}
