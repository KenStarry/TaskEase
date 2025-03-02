import 'package:go_router/go_router.dart';
import 'package:task_ease/core/util/routing/auth_routes.dart';
import 'package:task_ease/core/util/routing/dashboard_routes.dart';
import 'package:task_ease/features/auth/data/auth_notifier.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';
import 'package:task_ease/features/dashboard/presentation/pages/dashboard.dart';

import 'onboarding_routes.dart';

final AuthNotifier authNotifier = AuthNotifier();

final GoRouter appRouter = GoRouter(
  refreshListenable: authNotifier,
  initialLocation: "/onboarding",
  redirect: (context, state) {
    final isAuthenticated = authNotifier.user != null;
    final isLoggingIn = state.fullPath == '/onboarding';

    //  Redirect to login if the user is not authenticated
    if (!isAuthenticated) {
      return '/onboarding';
    }

    if (isLoggingIn) {
      return '/settings';
    }

    return null;
  },
  routes: [
    ...authRoutes,

    /// Dashboard Routes
    StatefulShellRoute.indexedStack(
        builder: (_, __, child) => Dashboard(child: child),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(routes: dashboardRoutes)
        ]),

    ...onboardingRoutes,

    // calendarRoute,

    sharedRoute
  ],
);
