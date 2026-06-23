import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_shop/core/di/injection.dart';
import 'package:my_shop/core/navigation/app_routes.dart';
import 'package:my_shop/presentation/bloc/auth/auth_cubit.dart';
import 'package:my_shop/presentation/screens/auth_screen.dart';

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
  ],
);
