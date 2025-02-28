import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:task_ease/core/presentation/components/page_header.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';
import 'package:task_ease/features/tasks/presentation/components/filters/tasks_by_date.dart';

import '../../../../core/model/task_model.dart';
import '../bloc/add_tasks_bloc.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  // late final List<TaskModel> _tasks;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   _tasks = [
  //     TaskModel(
  //         taskId: '1',
  //         taskName: "Hello there",
  //         taskIsComplete: false,
  //         taskDate: DateTime(2025, 1, 1).toString()),
  //     TaskModel(taskId: '2', taskName: "Another Task1", taskIsComplete: false),
  //     TaskModel(taskId: '3', taskName: "Another Task2", taskIsComplete: true, taskDate: DateTime(2025, 2, 12).toString()),
  //     TaskModel(taskId: '3', taskName: "Another Task2", taskIsComplete: true, taskDate: DateTime(2025, 2, 12).toString()),
  //     TaskModel(taskId: '3', taskName: "Another Task2", taskIsComplete: true, taskDate: DateTime(2025, 2, 12).toString()),
  //     TaskModel(taskId: '3', taskName: "Another Task2", taskIsComplete: true, taskDate: DateTime(2025, 2, 12).toString()),
  //     TaskModel(taskId: '4', taskName: "Another Task3", taskIsComplete: false),
  //     TaskModel(taskId: '4', taskName: "Another Task3", taskIsComplete: false),
  //     TaskModel(taskId: '4', taskName: "Another Task3", taskIsComplete: false),
  //     TaskModel(taskId: '4', taskName: "Another Task3", taskIsComplete: false),
  //     TaskModel(taskId: '4', taskName: "Another Task3", taskIsComplete: false),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<AddTasksBloc, AddTasksState>(
  builder: (context, tasksState) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: TasksHeader()),
            ...tasksByDate(context,
                allDates: tasksState is AddTasksSuccess ? tasksState.allTasks
                    .map((task) =>
                        task.taskDate?.formatDate(format: 'dd LLL yyyy'))
                    .toSet()
                    .toList() : [],
                tasks: tasksState is AddTasksSuccess ? tasksState.allTasks : [])
          ],
        ),
      );
  },
),
    );
  }
}
