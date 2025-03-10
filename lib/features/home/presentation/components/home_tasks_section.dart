import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/presentation/components/task_card.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';
import 'package:task_ease/core/util/theme/colors.dart';

import '../../../../core/presentation/components/bottomsheets/view_task_bottomsheet.dart';
import '../../../tasks/presentation/bloc/tasks_bloc.dart';

class HomeTasksSection extends StatefulWidget {
  const HomeTasksSection({super.key});

  @override
  State<HomeTasksSection> createState() => _HomeTasksSectionState();
}

class _HomeTasksSectionState extends State<HomeTasksSection> {
  // late final List<TaskModel> _todayTasks;

  @override
  void initState() {
    super.initState();

    // _todayTasks = [
    //   TaskModel(taskId: '1', taskName: "Hello there", taskIsComplete: false),
    //   TaskModel(taskId: '2', taskName: "Another Task", taskIsComplete: false),
    //   TaskModel(taskId: '3', taskName: "Another Task", taskIsComplete: true),
    //   TaskModel(taskId: '4', taskName: "Another Task", taskIsComplete: false),
    // ];

    BlocProvider.of<TasksBloc>(context).add(FetchAllTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: DecoratedSliver(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(24)),
        sliver: SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: BlocBuilder<TasksBloc, TasksState>(
            builder: (context, tasksState) {
              final todayTasks = tasksState is TasksSuccess
                  ? tasksState.allTasks.where((task) =>
                      task.taskDate?.formatDate(format: 'dd-MM-yyyy') ==
                      DateTime.now()
                          .toString()
                          .formatDate(format: 'dd-MM-yyyy')).toList()
                  : [];

              return MultiSliver(children: [
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Today's Tasks",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontWeight,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .color)),
                      todayTasks.isEmpty
                          ? SizedBox.shrink()
                          : SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularStepProgressIndicator(
                                  totalSteps: todayTasks.length,
                                  currentStep: todayTasks
                                      .where((task) => task.taskIsComplete!)
                                      .toList()
                                      .length,
                                  selectedStepSize: 3,
                                  unselectedStepSize: 3,
                                  unselectedColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  selectedColor:
                                      Theme.of(context).colorScheme.primary,
                                  roundedCap: (index, isRound) => true,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent),
                                    child: Center(
                                      child: Text(
                                          "${todayTasks.where((task) => task.taskIsComplete!).toList().length}/${todayTasks.length}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ),
                                  )),
                            )
                    ],
                  ),
                ),
                todayTasks.where((task) => !(task.taskIsComplete ?? false)).isEmpty
                    ? SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 16,
                          children: [
                            SvgPicture.asset(
                                "assets/images/undraw/complete_task.svg",
                                width: 150,
                                height: 150),
                            Text("All Clear",
                                style: Theme.of(context).textTheme.bodyLarge),
                            Text("Let's add something to do.",
                                style: Theme.of(context).textTheme.bodyMedium),
                            UnconstrainedBox(
                              child: FilledButton(
                                  onPressed: () {},
                                  style: FilledButton.styleFrom(
                                      foregroundColor: whiteColor,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/icons/add.svg",
                                          width: 24,
                                          height: 24,
                                          colorFilter: ColorFilter.mode(
                                              whiteColor, BlendMode.srcIn)),
                                      Text("Add Task",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium)
                                    ],
                                  )),
                            )
                          ],
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (context, index) => TaskCard(
                                task: todayTasks.where((task) => !(task.taskIsComplete ?? false)).take(3).toList()[index],
                            ),
                            childCount: todayTasks.where((task) => !(task.taskIsComplete ?? false)).take(3).length)),

                //  see All
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              foregroundColor: whiteColor),
                          child: Row(
                            spacing: 4,
                            children: [
                              Text("See All"),
                              Icon(Icons.chevron_right_rounded, size: 24)
                            ],
                          )),
                    ],
                  ),
                )
              ]);
            },
          ),
        ),
      ),
    );
  }
}
