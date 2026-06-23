import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/core/constants/app_sizes.dart';
import 'package:my_shop/core/constants/app_text_styles.dart';
import 'package:my_shop/l10n/app_localizations.dart';
import 'package:my_shop/presentation/bloc/auth/auth_cubit.dart';
import 'package:my_shop/presentation/bloc/auth/auth_state.dart';
import 'package:my_shop/shared/app_button.dart';
import 'package:my_shop/shared/app_text.dart';
import 'package:my_shop/shared/app_text_field.dart';

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
                AppText(
                  localizations.appName,
                  style: AppTextStyles.h1,
                  textAlign: .center,
                ),
                const SizedBox(height: AppSizes.authTitleBottomSpacing),
                AppTextField(
                  label: localizations.loginLabel,
                  hint: localizations.loginHint,
                  keyboardType: .emailAddress,
                  onChanged: context.read<AuthCubit>().emailChanged,
                ),
                const SizedBox(height: AppSizes.spacingMd),
                AppTextField(
                  label: localizations.passwordLabel,
                  hint: localizations.passwordHint,
                  obscureText: true,
                  onChanged: context.read<AuthCubit>().passwordChanged,
                ),
                const SizedBox(height: AppSizes.spacingXl),
                BlocSelector<AuthCubit, AuthState, bool>(
                  selector: (state) => state.isButtonEnabled,
                  builder: (context, isButtonEnabled) {
                    return AppButton(
                      text: localizations.signInButton,
                      onPressed: isButtonEnabled
                          ? () => FocusScope.of(context).unfocus()
                          : null,
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
