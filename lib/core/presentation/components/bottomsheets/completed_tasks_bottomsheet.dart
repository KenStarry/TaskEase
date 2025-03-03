import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/presentation/components/custom_text_field.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

import '../../../../features/auth/presentation/bloc/reset_password_bloc.dart';
import '../../../../features/auth/presentation/bloc/sign_up_bloc.dart';
import '../../../../features/tasks/presentation/bloc/tasks_bloc.dart';
import '../../../../features/tasks/presentation/components/filters/tasks_normal.dart';
import '../../../util/theme/colors.dart';
import '../snackbars/show_error_snackbar.dart';
import '../snackbars/show_success_snackbar.dart';

class CompletedTasksBottomsheet extends StatefulWidget {
  const CompletedTasksBottomsheet({super.key});

  @override
  State<CompletedTasksBottomsheet> createState() =>
      _CompletedTasksBottomsheetState();
}

class _CompletedTasksBottomsheetState extends State<CompletedTasksBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          width: double.infinity,
          height: 400,
          padding: const EdgeInsets.symmetric(vertical: 24),
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.2),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Completed Tasks",
                    style: Theme.of(context).textTheme.titleSmall),
              ),
              const SizedBox(height: 16),
              Expanded(child: BlocBuilder<TasksBloc, TasksState>(
                builder: (context, tasksState) {
                  return CustomScrollView(
                    slivers: [
                      tasksNormal(context,
                          color: Colors.transparent,
                          tasks: tasksState is TasksSuccess
                              ? tasksState.allTasks
                                  .where(
                                      (task) => (task.taskIsComplete ?? false))
                                  .toList()
                              : [])
                    ],
                  );
                },
              ))
            ],
          )),
    );
  }
}
