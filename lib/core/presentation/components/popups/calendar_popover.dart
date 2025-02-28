import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '../../../util/theme/colors.dart';

void showCalendarPopOver(BuildContext context, {void Function(List<DateTime>)? onValueChanged}) {
  final labelStyle = TextStyle(
    fontSize: Theme.of(context)
        .textTheme
        .bodyMedium!.fontSize,
    fontWeight: Theme.of(context)
        .textTheme
        .bodyMedium!.fontWeight,
    color: Theme.of(context)
        .textTheme
        .bodyMedium!.color!.withValues(alpha: 0.7),
  );

  showPopover(
      context: context,
      bodyBuilder: (context) => Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color:
            Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(24)),
        child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
                calendarType:
                CalendarDatePicker2Type.single,
                useAbbrLabelForMonthModePicker: true,
                weekdayLabelTextStyle: labelStyle,
                dayTextStyle: labelStyle,
                firstDate: DateTime.now(),
                disabledDayTextStyle: TextStyle(
                  fontSize: Theme.of(context)
                      .textTheme
                      .bodyMedium!.fontSize,
                  fontWeight: Theme.of(context)
                      .textTheme
                      .bodyMedium!.fontWeight,
                  color: Theme.of(context)
                      .textTheme
                      .bodyMedium!.color!.withValues(alpha: 0.2),
                ),
                selectedDayTextStyle: TextStyle(
                  fontSize: Theme.of(context)
                      .textTheme
                      .bodySmall!.fontSize,
                  fontWeight: Theme.of(context)
                      .textTheme
                      .bodySmall!.fontWeight,
                  color: whiteColor,
                ),
                disabledMonthTextStyle: TextStyle(
                  fontSize: Theme.of(context)
                      .textTheme
                      .bodySmall!.fontSize,
                  fontWeight: Theme.of(context)
                      .textTheme
                      .bodySmall!.fontWeight,
                  color: whiteColor,
                ),
                monthTextStyle: labelStyle,
                yearTextStyle: labelStyle,
                controlsTextStyle: TextStyle(
                  fontSize: Theme.of(context)
                      .textTheme
                      .bodyLarge!.fontSize,
                  fontWeight: Theme.of(context)
                      .textTheme
                      .bodyMedium!.fontWeight,
                  color: whiteColor,
                ),
                selectedMonthTextStyle: TextStyle(
                  fontSize: Theme.of(context)
                      .textTheme
                      .bodySmall!.fontSize,
                  fontWeight: Theme.of(context)
                      .textTheme
                      .bodySmall!.fontWeight,
                  color: whiteColor,
                )),
            onValueChanged: onValueChanged,
            value: [DateTime.now()]),
      ),
      backgroundColor:
      Theme.of(context).colorScheme.onPrimary,
      barrierDismissible: true,
      radius: 24,
      direction: PopoverDirection.top);
}