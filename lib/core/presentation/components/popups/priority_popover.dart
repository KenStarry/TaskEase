import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:popover/popover.dart';
import 'package:task_ease/core/model/board_model.dart';
import 'package:task_ease/core/presentation/components/task_radio.dart';
import 'package:task_ease/core/util/extensions/color_extensions.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

import '../../../model/enum/layouts_enum.dart';
import '../../../model/task_priority_model.dart';
import '../../../util/theme/colors.dart';

void showPriorityPopOver(BuildContext context,
    {required Function(TaskPriorityModel priority) onSelected}) {

  final List<TaskPriorityModel> priorities = [
    TaskPriorityModel(name: "Low", color: lowPriorityColor.toHex()),
    TaskPriorityModel(name: "Medium", color: mediumPriorityColor.toHex()),
    TaskPriorityModel(name: "High", color: highPriorityColor.toHex()),
    TaskPriorityModel(name: "Critical", color: criticalPriorityColor.toHex()),
  ];

  showPopover(
      context: context,
      bodyBuilder: (context) => Container(
        width: 250,
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(24)),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          slivers: [
            SliverToBoxAdapter(
              child: Text("Select Priority",
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                        (context, index) => GestureDetector(
                      onTap: () {
                        onSelected(priorities[index]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        // margin: const EdgeInsets.only(bottom: 8),
                        padding:
                        const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // color: Theme.of(context).colorScheme.onSecondary
                        ),
                        child: Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            TaskRadio(
                                size: Size(16, 16),
                                color: priorities[index].color?.toColor(),
                                isActive: false),
                            Expanded(
                              child: Text(
                                  priorities[index].name ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall),
                            )
                          ],
                        ),
                      ),
                    ),
                    childCount: priorities.length))
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      barrierDismissible: true,
      radius: 22,
      width: 230,
      height: 300,
      direction: PopoverDirection.bottom);
}
