import 'package:go_router/go_router.dart';
import 'package:task_ease/core/util/routing/dashboard_routes.dart';
import 'package:task_ease/features/dashboard/presentation/pages/dashboard.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    /// Dashboard Routes
    StatefulShellRoute.indexedStack(
        builder: (_, __, child) => Dashboard(child: child),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(routes: dashboardRoutes)
        ])
  ],
);
