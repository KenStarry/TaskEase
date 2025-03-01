import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popover/popover.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

import '../../../../features/tasks/presentation/bloc/tasks_bloc.dart';
import '../../../util/theme/colors.dart';

void showCalendarPopOver(BuildContext context,
    {DateTime? selectedDateTime,
    PopoverDirection? direction,
    void Function(List<DateTime>)? onValueChanged}) {
  final tasksState = context.read<TasksBloc>().state;

  final allDates = tasksState is TasksSuccess
      ? tasksState.allTasks
          .map((task) => task.taskDate?.formatDate(format: 'dd LLL yyyy'))
          .toSet()
          .toList()
      : [];

  final labelStyle = TextStyle(
    fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
    fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
    color:
        Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.7),
  );

  showPopover(
      context: context,
      bodyBuilder: (context) => Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                            calendarType: CalendarDatePicker2Type.single,
                            useAbbrLabelForMonthModePicker: true,
                            weekdayLabelTextStyle: labelStyle,
                            calendarViewScrollPhysics: BouncingScrollPhysics(),
                            dayTextStyle: labelStyle,
                            firstDate: DateTime(1900, 1, 1),
                            calendarViewMode: CalendarDatePicker2Mode.day,
                            disabledDayTextStyle: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontWeight,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .withValues(alpha: 0.2),
                            ),
                            selectedDayTextStyle: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontWeight,
                              color: whiteColor,
                            ),
                            disabledMonthTextStyle: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontWeight,
                              color: whiteColor,
                            ),
                            monthTextStyle: labelStyle,
                            yearTextStyle: labelStyle,
                            controlsTextStyle: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontWeight,
                              color: whiteColor,
                            ),
                            currentDate: selectedDateTime ?? DateTime.now(),
                            dayMaxWidth: 30,
                            dayBuilder: ({
                              required date,
                              textStyle,
                              decoration,
                              isSelected,
                              isDisabled,
                              isToday,
                            }) =>
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: isSelected != null && isSelected
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Colors.transparent),
                                    color: isToday != null && isToday
                                        ? Theme.of(context).colorScheme.primary
                                        : isSelected != null && isSelected
                                            ? Colors.transparent
                                            : Colors.transparent,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(date.day.toString(),
                                          style: textStyle),
                                      Visibility(
                                        visible: allDates.contains(date
                                            .toString()
                                            .formatDate(format: 'dd LLL yyyy')),
                                        child: Container(
                                          width: 4,
                                          height: 4,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                            selectedMonthTextStyle: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .fontWeight,
                              color: whiteColor,
                            )),
                        onValueChanged: onValueChanged,
                        value: [DateTime.now()])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          onValueChanged!([DateTime.now()]);
                        },
                        child: Text("Today")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                  ],
                )
              ],
            ),
          ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      barrierDismissible: true,
      width: 300,
      height: 300,
      radius: 24,
      direction: direction ?? PopoverDirection.top);
}
