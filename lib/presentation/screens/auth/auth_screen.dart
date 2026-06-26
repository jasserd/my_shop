import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/navigation/navigation.dart';
import 'package:my_shop/presentation/screens/auth/bloc/auth_cubit.dart';
import 'package:my_shop/presentation/screens/auth/bloc/auth_state.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const .all(AppSizes.screenPadding),
            child: Column(
              mainAxisSize: .min,
              children: [
                AppText(localizations.appName, style: AppTextStyles.h1(), textAlign: .center),
                const SizedBox(height: AppSizes.authTitleBottomSpacing),
                Column(
                  spacing: AppSizes.spacingMd,
                  children: [
                    AppTextField(
                      label: localizations.loginLabel,
                      hint: localizations.loginHint,
                      keyboardType: .emailAddress,
                      onChanged: context.read<AuthCubit>().emailChanged,
                    ),
                    AppTextField(
                      label: localizations.passwordLabel,
                      hint: localizations.passwordHint,
                      obscureText: true,
                      onChanged: context.read<AuthCubit>().passwordChanged,
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.spacingXl),
                BlocSelector<AuthCubit, AuthState, bool>(
                  selector: (state) => state.isButtonEnabled,
                  builder: (context, isButtonEnabled) {
                    return AppButton(
                      text: localizations.signInButton,
                      onPressed: isButtonEnabled ? () => context.go(AppRoutes.home) : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
