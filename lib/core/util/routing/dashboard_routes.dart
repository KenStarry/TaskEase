import 'package:go_router/go_router.dart';
import 'package:task_ease/features/boards/presentation/pages/boards_page.dart';
import 'package:task_ease/features/calendar/presentation/pages/calendar_view_page.dart';
import 'package:task_ease/features/home/presentation/pages/home_page.dart';
import 'package:task_ease/features/settings/presentation/pages/settings_page.dart';
import 'package:task_ease/features/shared/presentation/pages/shared_page.dart';
import 'package:task_ease/features/tasks/presentation/pages/tasks_page.dart';

final dashboardRoutes = [homeRoute, tasksRoute, calendarRoute, settingsRoute];

final homeRoute = GoRoute(
    path: "/home", name: "home", builder: (context, state) => HomePage());

final tasksRoute = GoRoute(
    path: "/tasks", name: "tasks", builder: (context, state) => TasksPage());

final boardsRoute = GoRoute(
    path: "/boards", name: "boards", builder: (context, state) => BoardsPage());

final settingsRoute = GoRoute(
    path: "/settings", name: "settings", builder: (context, state) => SettingsPage());

final calendarRoute = GoRoute(
    path: "/calendar", name: "calendar", builder: (context, state) => CalendarViewPage());

final sharedRoute = GoRoute(
    path: "/shared", name: "shared", builder: (context, state) => SharedPage());