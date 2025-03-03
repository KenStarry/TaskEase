import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_ease/core/di/di.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/presentation/bloc/backup_bloc.dart';
import 'package:task_ease/core/presentation/bloc/user_bloc.dart';
import 'package:task_ease/core/util/constants/hive_constants.dart';
import 'package:task_ease/core/util/functions/shared_preferences_util.dart';
import 'package:task_ease/features/auth/presentation/bloc/google_sign_in_bloc.dart';
import 'package:task_ease/features/auth/presentation/bloc/reset_password_bloc.dart';
import 'package:task_ease/features/auth/presentation/bloc/sign_up_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/add_tasks_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/delete_task_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/task_layout_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/update_task_bloc.dart';
import 'package:task_ease/firebase_options.dart';

import 'core/model/board_model.dart';
import 'core/model/task_priority_model.dart';
import 'core/util/routing/app_route.dart';
import 'core/util/theme/app_theme.dart';
import 'features/auth/presentation/bloc/login_bloc.dart';
import 'features/settings/presentation/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);

  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(BoardModelAdapter());
  Hive.registerAdapter(TaskPriorityModelAdapter());

  Hive.openBox(tasksBox);

  await setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => GoogleSignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => ResetPasswordBloc(),
        ),
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => AddTasksBloc(),
        ),
        BlocProvider(
          create: (context) => UpdateTaskBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteTaskBloc(),
        ),
        BlocProvider(
          create: (context) => TaskLayoutBloc(),
        ),
        BlocProvider(
          create: (context) => BackupBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()
            ..add(ToggleThemeEvent(
                themeMode:
                    locator.get<SharedPreferencesUtil>().getThemeMode())),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            title: "TaskEase",
            routerDelegate: appRouter.routerDelegate,
            routeInformationParser: appRouter.routeInformationParser,
            routeInformationProvider: appRouter.routeInformationProvider,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: themeState is ThemeDarkMode
                ? ThemeMode.dark
                : themeState is ThemeLightMode
                    ? ThemeMode.light
                    : ThemeMode.system,
          );
        },
      ),
    );
  }
}
