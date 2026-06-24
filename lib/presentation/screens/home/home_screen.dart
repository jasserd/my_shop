import 'package:flutter/material.dart';
import 'package:my_shop/core/l10n/app_localizations.dart';
import 'package:my_shop/presentation/screens/home/widgets/home_content.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          AppHeader(
            title: localizations.appName,
            actionIcon: Icons.person,
            actionTooltip: localizations.profileTooltip,
            onActionPressed: () {},
          ),
          const Expanded(child: HomeContent()),
        ],
      ),
    );
  }
}
