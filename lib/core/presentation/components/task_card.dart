import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/presentation/components/task_radio.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

import '../../../features/tasks/presentation/bloc/tasks_bloc.dart';

class TaskCard extends StatefulWidget {
  final TaskModel task;
  final EdgeInsets? margin;

  const TaskCard({super.key, required this.task, this.margin});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Widget _taskCardContent({required String asset, required String content}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8,
        children: [
          SvgPicture.asset(asset,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(
                  Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .color!
                      .withValues(alpha: 0.6),
                  BlendMode.srcIn)),
          Text(content,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                fontWeight: Theme.of(context).textTheme.bodySmall!.fontWeight,
                color: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .color!
                    .withValues(alpha: 0.6),
              ))
        ],
      );

  Widget card(
          {required TaskModel task,
          required TasksState tasksState,
          bool showMoreDetails = true,
          bool isSubtask = false,
          required bool hasSubtasks}) =>
      Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TaskRadio(
            size: isSubtask ? Size(20, 20) : null,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(task.taskName ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium),
                showMoreDetails ? SizedBox(height: 8) : SizedBox.shrink(),
                showMoreDetails
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          _taskCardContent(
                              asset: "assets/images/icons/calendar.svg",
                              content: (task.taskDate
                                      ?.toString()
                                      .formatDate(format: "dd MMM, yy")) ??
                                  "No date"),
                          _taskCardContent(
                              asset: "assets/images/icons/priority.svg",
                              content: "1"),
                          Visibility(
                            visible: tasksState is TasksSuccess && hasSubtasks,
                            child: _taskCardContent(
                                asset: "assets/images/icons/subtask.svg",
                                content: tasksState is TasksSuccess
                                    ? tasksState.allTasks
                                        .where((task) =>
                                            task.taskParentId != null &&
                                            task.taskParentId == task.taskId)
                                        .toList()
                                        .length
                                        .toString()
                                    : "0"),
                          ),
                        ],
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, tasksState) {
        final hasSubtasks = tasksState is TasksSuccess
            ? tasksState.allTasks
                .where((task) => task.taskParentId != null)
                .map((task) => task.taskParentId)
                .toList()
                .contains(widget.task.taskId)
            : false;

        final allSubtasksForThisId = tasksState is TasksSuccess
            ? tasksState.allTasks
                .where((task) =>
                    task.taskParentId != null &&
                    task.taskParentId == widget.task.taskId)
                .toList()
            : [];

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: widget.margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              card(
                  tasksState: tasksState,
                  hasSubtasks: hasSubtasks,
                  task: widget.task),
              Visibility(
                  visible: hasSubtasks,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(left: 41),
                    child: Column(
                      spacing: 12,
                      children: allSubtasksForThisId
                          .map((task) => card(
                              tasksState: tasksState,
                              hasSubtasks: hasSubtasks,
                              isSubtask: true,
                              showMoreDetails: false,
                              task: task))
                          .toList(),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
