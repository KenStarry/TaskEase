import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/presentation/components/task_radio.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart' as x;
import 'package:task_ease/features/tasks/presentation/bloc/delete_task_bloc.dart';

import '../../../../features/tasks/presentation/bloc/tasks_bloc.dart';
import '../task_card.dart';

class ViewTaskBottomsheet extends StatefulWidget {
  final TaskModel taskModel;

  const ViewTaskBottomsheet({super.key, required this.taskModel});

  @override
  State<ViewTaskBottomsheet> createState() => _ViewTaskBottomsheetState();
}

class _ViewTaskBottomsheetState extends State<ViewTaskBottomsheet> {
  Widget taskDetailRow({required String asset, required String description}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          SvgPicture.asset(
            asset,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.bodySmall!.color!, BlendMode.srcIn),
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  parent webcrumb
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.taskModel.taskParentId == null
                    ? SizedBox.shrink()
                    : BlocBuilder<TasksBloc, TasksState>(
                        builder: (context, tasksState) {
                          return Expanded(
                              child: GestureDetector(
                            onTap: () {
                              final parentTask = tasksState is TasksSuccess
                                  ? tasksState.allTasks.firstWhere((task) =>
                                      task.taskId ==
                                      widget.taskModel.taskParentId)
                                  : null;

                              if (parentTask != null) {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    useRootNavigator: true,
                                    builder: (context) => ViewTaskBottomsheet(
                                        taskModel: parentTask));
                              }
                            },
                            child: Row(
                              spacing: 4,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                  child: Text("Parent",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ),
                                Icon(Icons.chevron_right_rounded,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color),
                                BlocBuilder<TasksBloc, TasksState>(
                                  builder: (context, tasksState) {
                                    return Text(
                                        tasksState is TasksSuccess
                                            ? tasksState.allTasks
                                                .firstWhere(
                                                    (task) =>
                                                        task.taskId ==
                                                        widget.taskModel
                                                            .taskParentId,
                                                    orElse: () => TaskModel())
                                                .taskName!
                                            : "No parent",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall);
                                  },
                                ),
                              ],
                            ),
                          ));
                        },
                      ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/icons/edit.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodyMedium!.color!,
                          BlendMode.srcIn),
                    )),
                IconButton(
                    onPressed: () {
                      //  Delete the task from hive
                      BlocProvider.of<TasksBloc>(context).add(
                          DeleteTaskFromBlocEvent(
                              taskId: widget.taskModel.taskId!));
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      "assets/images/icons/delete.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodyMedium!.color!,
                          BlendMode.srcIn),
                    ))
              ],
            ),

            widget.taskModel.taskParentId == null
                ? SizedBox.shrink()
                : SizedBox(height: 16),

            //  task name
            Row(
              spacing: 16,
              children: [
                TaskRadio(
                  size: const Size(20, 20),
                  color: widget.taskModel.taskColor?.toColor() ??
                      Theme.of(context).colorScheme.primary,
                  isActive: widget.taskModel.taskIsComplete!,
                ),
                Expanded(
                  child: Text(widget.taskModel.taskName!,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            ),

            SizedBox(height: 24),

            //  Task Details, eg date etc
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.taskModel.taskDescription == null
                    ? SizedBox.shrink()
                    : taskDetailRow(
                        asset: "assets/images/icons/notes.svg",
                        description: widget.taskModel.taskDescription ??
                            'No Description'),
                widget.taskModel.taskDescription == null
                    ? SizedBox.shrink()
                    : SizedBox(height: 16),
                taskDetailRow(
                    asset: "assets/images/icons/calendar.svg",
                    description: widget.taskModel.taskDate
                            ?.formatDate(format: "dd MMM, yyyy") ??
                        'No Date'),
                SizedBox(height: 16),
                taskDetailRow(
                    asset: "assets/images/icons/priority.svg",
                    description:
                        widget.taskModel.taskPriority?.name ?? 'No Priority'),
              ],
            ),

            SizedBox(height: 24),

            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, tasksState) {
                final allSubTasks = tasksState is TasksSuccess
                    ? tasksState.allTasks
                        .where((task) =>
                            task.taskParentId == widget.taskModel.taskId)
                        .toList()
                    : <TaskModel>[];
                return allSubTasks.isEmpty
                    ? SizedBox.shrink()
                    : SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: CustomScrollView(
                          slivers: [
                            BlocBuilder<TasksBloc, TasksState>(
                              builder: (context, tasksState) {
                                return DecoratedSliver(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24)),
                                  sliver: SliverPadding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    sliver: SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                            (context, index) => TaskCard(
                                                task: allSubTasks[index]),
                                            childCount: allSubTasks.length)),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
