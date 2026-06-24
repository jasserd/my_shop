import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/di/di.dart';
import 'package:my_shop/presentation/screens/auth/auth_screen.dart';
import 'package:my_shop/presentation/screens/auth/bloc/auth_cubit.dart';
import 'package:my_shop/presentation/screens/catalog/bloc/catalog_cubit.dart';
import 'package:my_shop/presentation/screens/catalog/catalog_screen.dart';
import 'package:my_shop/presentation/screens/cart/bloc/cart_cubit.dart';
import 'package:my_shop/presentation/screens/cart/cart_screen.dart';
import 'package:my_shop/presentation/screens/favorites/bloc/favorites_cubit.dart';
import 'package:my_shop/presentation/screens/favorites/favorites_screen.dart';
import 'package:my_shop/presentation/screens/home/bloc/home_cubit.dart';
import 'package:my_shop/presentation/screens/home/home_screen.dart';
import 'package:my_shop/presentation/screens/main/main_screen.dart';
import 'package:my_shop/presentation/screens/payment/payment_screen.dart';

import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.auth,
  routes: [
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const AuthScreen(),
      ),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..load(),
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.catalog,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<CatalogCubit>()..load(),
            child: const CatalogScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.favorites,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<FavoritesCubit>()..load(),
            child: const FavoritesScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.cart,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<CartCubit>()..load(),
            child: const CartScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.payment,
          builder: (context, state) => const PaymentScreen(),
        ),
      ],
    ),
  ],
);
