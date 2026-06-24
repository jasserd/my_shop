import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/navigation/navigation.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_cubit.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_state.dart';
import 'package:my_shop/presentation/screens/cart/widgets/cart_checkout_panel.dart';
import 'package:my_shop/presentation/screens/cart/widgets/delivery_address_form.dart';
import 'package:my_shop/shared/widgets/widgets.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const AppLoader();
        }
        if (state.cartItems.isEmpty) {
          return const _EmptyCart();
        }

        return _FilledCart(state: state);
      },
    );
  }
}

class _FilledCart extends StatelessWidget {
  const _FilledCart({required this.state});

  final CartState state;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const .fromLTRB(
            AppSizes.screenPadding,
            AppSizes.spacingLg,
            AppSizes.screenPadding,
            144,
          ),
          child: Column(
            children: [
              for (final cartItem in state.cartItems) ...[
                CartItemCard(
                  cartItem: cartItem,
                  onIncrement: () => cartCubit.increment(cartItem),
                  onDecrement: () => cartCubit.decrement(cartItem),
                ),
                const SizedBox(height: AppSizes.spacingMd),
              ],
              const SizedBox(height: AppSizes.spacingMd),
              DeliveryAddressForm(cartCubit: cartCubit),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CartCheckoutPanel(
            totalPrice: state.totalPrice,
            isCheckoutEnabled: state.isCheckoutEnabled,
            onCheckout: () {
              cartCubit.checkout();
              context.go(AppRoutes.payment);
            },
          ),
        ),
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Center(
      child: Padding(
        padding: const .all(AppSizes.screenPadding),
        child: Column(
          mainAxisSize: .min,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 64,
              color: AppColors.border,
            ),
            const SizedBox(height: AppSizes.spacingXl),
            AppText(
              localizations.emptyCartTitle,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSizes.spacingXl),
            AppButton(
              text: localizations.goShoppingButton,
              onPressed: () => context.go(AppRoutes.home),
            ),
          ],
        ),
      ),
    );
  }
}
