import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ease/core/presentation/components/page_header.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';
import 'package:task_ease/features/tasks/presentation/bloc/tasks_bloc.dart';
import 'package:task_ease/features/tasks/presentation/components/filters/tasks_by_date.dart';
import 'package:task_ease/features/tasks/presentation/screens/task_calendar_view_screen.dart';

import '../../../../core/model/task_model.dart';
import '../bloc/add_tasks_bloc.dart';
import '../bloc/task_layout_bloc.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  // late final List<TaskModel> _tasks;
  //
  @override
  void initState() {
    super.initState();

    BlocProvider.of<TasksBloc>(context).add(FetchAllTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: BlocListener<AddTasksBloc, AddTasksState>(
        listener: (context, tasksState) {
          if (tasksState is AddTasksSuccess) {
            BlocProvider.of<TasksBloc>(context).add(FetchAllTasksEvent());
          }
        },
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, tasksState) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: BlocBuilder<TaskLayoutBloc, TaskLayoutState>(
                builder: (context, taskLayoutState) {
                  return taskLayoutState is TaskLayoutCalendarView
                      ? TaskCalendarViewScreen()
                      : CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(child: TasksHeader()),
                            ...tasksByDate(context,
                                allDates: tasksState is TasksSuccess
                                    ? tasksState.allTasks
                                        .where((task) =>
                                            !(task.taskIsComplete ?? false))
                                        .map((task) => task.taskDate
                                            ?.formatDate(format: 'dd LLL yyyy'))
                                        .toSet()
                                        .toList()
                                    : [],
                                tasks: tasksState is TasksSuccess
                                    ? tasksState.allTasks
                                        .where((task) =>
                                            !(task.taskIsComplete ?? false))
                                        .toList()
                                    : []),
                            SliverToBoxAdapter(child: SizedBox(height: 100))
                          ],
                        );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
