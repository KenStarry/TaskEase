import 'package:go_router/go_router.dart';
import 'package:task_ease/core/util/routing/dashboard_routes.dart';
import 'package:task_ease/features/dashboard/presentation/pages/dashboard.dart';

import 'onboarding_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/onboarding",
  routes: [
    /// Dashboard Routes
    StatefulShellRoute.indexedStack(
        builder: (_, __, child) => Dashboard(child: child),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(routes: dashboardRoutes)
        ]),

    ...onboardingRoutes,

    calendarRoute,

    sharedRoute
  ],
);
