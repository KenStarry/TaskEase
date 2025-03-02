import 'package:go_router/go_router.dart';
import 'package:task_ease/features/auth/presentation/pages/login_page.dart';
import 'package:task_ease/features/auth/presentation/pages/sign_up_page.dart';
import 'package:task_ease/features/boards/presentation/pages/boards_page.dart';
import 'package:task_ease/features/calendar/presentation/pages/calendar_view_page.dart';
import 'package:task_ease/features/home/presentation/pages/home_page.dart';
import 'package:task_ease/features/onboarding/presentation/pages/onboarding.dart';
import 'package:task_ease/features/settings/presentation/pages/settings_page.dart';
import 'package:task_ease/features/shared/presentation/pages/shared_page.dart';
import 'package:task_ease/features/tasks/presentation/pages/tasks_page.dart';

final authRoutes = [loginRoute, signupRoute];

final loginRoute = GoRoute(
    path: "/login", name: "login", builder: (context, state) => LoginPage());

final signupRoute = GoRoute(
    path: "/signup", name: "signup", builder: (context, state) => SignUpPage());