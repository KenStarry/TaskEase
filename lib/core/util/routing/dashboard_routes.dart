import 'package:go_router/go_router.dart';
import 'package:task_ease/features/home/presentation/pages/home_page.dart';

final dashboardRoutes = [homeRoute];

final homeRoute = GoRoute(
    path: "/home", name: "home", builder: (context, state) => HomePage());
