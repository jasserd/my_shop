import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/constants/constants.dart';
import 'package:my_shop/core/l10n/l10n.dart';
import 'package:my_shop/core/navigation/navigation.dart';
import 'package:my_shop/core/services/services.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_cubit.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_state.dart';
import 'package:my_shop/presentation/screens/cart/widgets/cart_checkout_panel.dart';
import 'package:my_shop/presentation/screens/cart/widgets/delivery_address_form.dart';
import 'package:my_shop/shared/components/components.dart';
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
  static final _paymentService = PaymentService();

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final cartChildren = <Widget>[];
    for (final cartItem in state.cartItems) {
      cartChildren.add(
        CartItemCard(
          cartItem: cartItem,
          onIncrement: () => cartCubit.increment(cartItem),
          onDecrement: () => cartCubit.decrement(cartItem),
        ),
      );
    }
    cartChildren.addAll([
      const SizedBox(height: AppSizes.spacingMd),
      DeliveryAddressForm(deliveryAddress: state.deliveryAddress, onChanged: cartCubit.deliveryAddressChanged),
    ]);

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const .fromLTRB(
            AppSizes.screenPadding,
            AppSizes.spacingLg,
            AppSizes.screenPadding,
            AppSizes.cartCheckoutPanelSpace,
          ),
          child: Column(spacing: AppSizes.spacingMd, children: cartChildren),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CartCheckoutPanel(
            totalPrice: state.totalPrice,
            isCheckoutEnabled: state.isCheckoutEnabled,
            onCheckout: () => _checkout(context, cartCubit),
          ),
        ),
      ],
    );
  }

  Future<void> _checkout(BuildContext context, CartCubit cartCubit) async {
    final localizations = AppLocalizations.of(context);
    final status = await _paymentService.pay(
      amount: state.totalPrice,
      title: localizations.appName,
      subtitle: localizations.paymentOrderSubtitle,
    );

    if (!context.mounted) {
      return;
    }

    if (status == PaymentStatus.success) {
      cartCubit.checkout();
      context.go(AppRoutes.payment);
      return;
    }

    context.go(AppRoutes.paymentFailure);
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
          spacing: AppSizes.spacingXl,
          mainAxisSize: .min,
          children: [
            const AppIcon.large(Icons.shopping_cart_outlined, color: AppColors.border),
            AppText(localizations.emptyCartTitle, style: AppTextStyles.bodyLarge(color: AppColors.textSecondary)),
            AppButton(text: localizations.goShoppingButton, onPressed: () => context.go(AppRoutes.home)),
          ],
        ),
      ),
    );
  }
}
