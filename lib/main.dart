import 'package:flutter/material.dart';

import 'core/util/routing/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "TaskEase",
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.lightTheme(),
      // darkTheme: AppTheme.lightTheme(),
      themeMode: ThemeMode.dark,
    );
  }
}
