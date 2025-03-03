import 'package:go_router/go_router.dart';
import 'package:task_ease/features/boards/presentation/pages/boards_page.dart';
import 'package:task_ease/features/calendar/presentation/pages/calendar_view_page.dart';
import 'package:task_ease/features/home/presentation/pages/home_page.dart';
import 'package:task_ease/features/onboarding/presentation/pages/onboarding.dart';
import 'package:task_ease/features/settings/presentation/pages/settings_page.dart';
import 'package:task_ease/features/shared/presentation/pages/shared_page.dart';
import 'package:task_ease/features/splash/presentation/pages/splash_screen.dart';
import 'package:task_ease/features/tasks/presentation/pages/tasks_page.dart';

final onboardingRoutes = [onboardingRoute, splashRoute];

final splashRoute = GoRoute(
    path: "/", name: "/", builder: (context, state) => SplashScreen());

final onboardingRoute = GoRoute(
    path: "/onboarding", name: "onboarding", builder: (context, state) => Onboarding());