import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
import 'package:my_shop/core/navigation/app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.auth,
  routes: [
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const AuthScreen(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => BlocProvider(
                create: (context) => HomeCubit()..load(),
                child: const HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.catalog,
              builder: (context, state) => BlocProvider(
                create: (context) => CatalogCubit()..load(),
                child: const CatalogScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => BlocProvider(
                create: (context) => FavoritesCubit()..load(),
                child: const FavoritesScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.cart,
              builder: (context, state) => BlocProvider(
                create: (context) => CartCubit()..load(),
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
    ),
  ],
);
