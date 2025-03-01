import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/presentation/components/page_header.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';
import 'package:task_ease/core/util/theme/colors.dart';
import 'package:task_ease/features/tasks/presentation/components/filters/tasks_normal.dart';

import '../../../tasks/presentation/bloc/tasks_bloc.dart';
import '../../../tasks/presentation/components/filters/tasks_by_date.dart';

class CalendarViewPage extends StatefulWidget {
  const CalendarViewPage({super.key});

  @override
  State<CalendarViewPage> createState() => _CalendarViewPageState();
}

class _CalendarViewPageState extends State<CalendarViewPage> {
  EasyDatePickerController controller = EasyDatePickerController();
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    BlocProvider.of<TasksBloc>(context).add(FetchAllTasksEvent());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            CalendarHeader(),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_left_rounded),
                        iconSize: 28,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              currentDate.day == DateTime.now().day
                                  ? 'Today'
                                  : currentDate.day ==
                                          DateTime.now()
                                              .add(Duration(days: 1))
                                              .day
                                      ? 'Tomorrow'
                                      : currentDate.day ==
                                              DateTime.now()
                                                  .subtract(Duration(days: 1))
                                                  .day
                                          ? 'Yesterday'
                                          : currentDate.toString().formatDate(
                                              format: 'dd MMM, yyyy'),
                              style: Theme.of(context).textTheme.titleSmall)
                        ],
                      )),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right_rounded),
                        iconSize: 28,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    EasyTheme(
                      data: EasyTheme.of(context).copyWithState(
                          selectedDayTheme: DayThemeData(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          unselectedDayTheme: DayThemeData(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color),
                          disabledDayTheme: DayThemeData(
                            backgroundColor: Colors.grey.shade100,
                          ),
                          selectedCurrentDayTheme: DayThemeData(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: whiteColor)),
                      child: EasyDateTimeLinePicker(
                        controller: controller,
                        focusedDate: currentDate,
                        firstDate: DateTime(1900, 1, 1),
                        lastDate: DateTime(2100, 1, 1),
                        itemExtent: 50,
                        dayElementsOrder: [
                          // DayElement.top(),
                          DayElement.bottom(),
                          DayElement.middle(),
                        ],
                        currentDate: DateTime.now(),
                        selectionMode: SelectionMode.alwaysFirst(),
                        headerOptions:
                            HeaderOptions(headerType: HeaderType.none),
                        timelineOptions: TimelineOptions(
                          height: 60,
                        ),
                        onDateChange: (DateTime date) {
                          setState(() {
                            currentDate = date;
                          });
                        },
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 24),
            Expanded(child: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, tasksState) {
                return CustomScrollView(
                  slivers: [
                    tasksState is TasksSuccess &&
                            tasksState.allTasks
                                .where((task) =>
                                    task.taskDate
                                        ?.formatDate(format: 'dd MMM, yy') ==
                                    currentDate
                                        .toString()
                                        .formatDate(format: 'dd MMM, yy'))
                                .isEmpty
                        ? SliverToBoxAdapter(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 24,
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/undraw/no_event.svg",
                                      width: 200,
                                      height: 200),
                                  Text(
                                    "You’re as free as a Friday afternoon.\nTime to celebrate! 🍾",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                          )
                        : tasksNormal(context,
                            tasks: tasksState is TasksSuccess
                                ? tasksState.allTasks
                                    .where((task) =>
                                        task.taskDate?.formatDate(
                                            format: 'dd MMM, yy') ==
                                        currentDate
                                            .toString()
                                            .formatDate(format: 'dd MMM, yy'))
                                    .toList()
                                : []),
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
