import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/presentation/components/task_radio.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';
import 'package:task_ease/features/tasks/presentation/bloc/update_task_bloc.dart';

import '../../../features/tasks/presentation/bloc/tasks_bloc.dart';

class TaskCard extends StatefulWidget {
  final TaskModel task;
  final EdgeInsets? margin;

  const TaskCard({super.key, required this.task, this.margin});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> with TickerProviderStateMixin {
  AnimationController? taskCardAnimation;

  Widget _taskCardContent(
          {required String asset,
          bool isSelected = false,
          required String content}) =>
      Opacity(
        opacity: isSelected ? 0.4 : 1,
        child: Row(
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
        ),
      );
  List<String> selectedId = [];

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
          BlocListener<UpdateTaskBloc, UpdateTaskState>(
            listener: (context, updateTaskState) {
              if (updateTaskState is UpdateTaskSuccess) {
                /// Update Task in all tasks bloc
                BlocProvider.of<TasksBloc>(context).add(UpdateTasksInBlocEvent(
                    updatedTask: updateTaskState.updatedTask));
              }
            },
            child: TaskRadio(
              size: isSubtask ? Size(20, 20) : Size(22, 22),
              isActive: task.taskIsComplete ?? false,
              onTap: (selected) {
                final updatedTaskModel =
                    task.copyWith(taskIsComplete: selected);

                /// Update this Id to hive as completed
                BlocProvider.of<UpdateTaskBloc>(context)
                    .add(UpdateTaskInHiveEvent(updatedTask: updatedTaskModel));

                // if (selected) {
                //   taskCardAnimation!.forward();
                // }

                setState(() {
                  if (selected) {
                    selectedId.add(task.taskId ?? '');
                  } else {
                    selectedId.removeWhere((id) => id == task.taskId);
                  }
                });
              },
            ),
          )
              .animate(
                  autoPlay: false,
                  onInit: (controller) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        taskCardAnimation = controller;
                      });
                    });
                  },
                  delay: Duration(milliseconds: 500))
              .moveY(
                  begin: 0,
                  end: 20,
                  duration: Duration(milliseconds: 350),
                  curve: Curves.ease)
              .then()
              .moveY(
                  begin: 0,
                  end: -50,
                  duration: Duration(milliseconds: 350),
                  curve: Curves.ease)
              .fadeOut(
                  duration: Duration(milliseconds: 600), curve: Curves.ease),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(task.taskName ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      decoration: (task.taskIsComplete ?? false) ||
                              selectedId.contains(task.taskId)
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: (task.taskIsComplete ?? false) ||
                              selectedId.contains(task.taskId)
                          ? Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color!
                              .withValues(alpha: 0.4)
                          : Theme.of(context).textTheme.bodyMedium!.color,
                      decorationThickness: 2,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.bodyMedium!.fontWeight,
                      color: (task.taskIsComplete ?? false) ||
                              selectedId.contains(task.taskId)
                          ? Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color!
                              .withValues(alpha: 0.4)
                          : Theme.of(context).textTheme.bodyMedium!.color,
                    )),
                showMoreDetails ? SizedBox(height: 8) : SizedBox.shrink(),
                showMoreDetails
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 16,
                        children: [
                          _taskCardContent(
                              asset: "assets/images/icons/calendar.svg",
                              isSelected: (task.taskIsComplete ?? false) ||
                                  selectedId.contains(task.taskId),
                              content: (task.taskDate
                                      ?.toString()
                                      .formatDate(format: "dd MMM, yy")) ??
                                  "No date"),
                          _taskCardContent(
                              asset: "assets/images/icons/priority.svg",
                              isSelected: (task.taskIsComplete ?? false) ||
                                  selectedId.contains(task.taskId),
                              content: "1"),
                          Visibility(
                            visible: tasksState is TasksSuccess && hasSubtasks,
                            child: _taskCardContent(
                                asset: "assets/images/icons/subtask.svg",
                                isSelected: (task.taskIsComplete ?? false) ||
                                    selectedId.contains(task.taskId),
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
          )
              .animate(
                  autoPlay: false,
                  onInit: (controller) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        taskCardAnimation = controller;
                      });
                    });
                  })
              .moveY(
                  begin: 0,
                  end: 20,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.ease)
              .then()
              .moveY(
                  begin: 0,
                  end: -50,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.ease)
              .fadeOut(
                  duration: Duration(milliseconds: 500), curve: Curves.ease),
        ],
      );

  @override
  void initState() {
    super.initState();

    taskCardAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

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
                    task.taskParentId != null && !(task.taskIsComplete ?? false) &&
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
                    margin: allSubtasksForThisId.isEmpty ? null : const EdgeInsets.only(top: 20),
                    padding: allSubtasksForThisId.isEmpty ? null : const EdgeInsets.only(left: 41),
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
