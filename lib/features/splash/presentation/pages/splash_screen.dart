import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../settings/presentation/theme_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () => context.pushNamed('onboarding'));
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
              statusBarIconBrightness: themeState is ThemeDarkMode
                  ? Brightness.light
                  : themeState is ThemeLightMode
                      ? Brightness.dark
                      : null,
              statusBarColor: Colors.transparent,
              systemNavigationBarColor:
                  Theme.of(context).scaffoldBackgroundColor),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/icons/logo.png",
                      width: 250, height: 250),
                  Text("TaskEase",
                      style: Theme.of(context).textTheme.titleMedium)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
