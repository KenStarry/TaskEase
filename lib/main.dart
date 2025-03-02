import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_ease/core/di/di.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/util/constants/hive_constants.dart';
import 'package:task_ease/features/auth/presentation/bloc/sign_up_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/add_tasks_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/task_layout_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:task_ease/features/tasks/presentation/bloc/update_task_bloc.dart';
import 'package:task_ease/firebase_options.dart';

import 'core/util/routing/app_route.dart';
import 'core/util/theme/app_theme.dart';
import 'features/auth/presentation/bloc/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);

  Hive.registerAdapter(TaskModelAdapter());

  Hive.openBox(tasksBox);

  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
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
          create: (context) => TaskLayoutBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: "TaskEase",
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        routeInformationProvider: appRouter.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
