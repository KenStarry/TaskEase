import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

import '../../../../../core/presentation/components/task_card.dart';

Widget tasksNormal(BuildContext context,
    {required List<TaskModel> tasks}) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    sliver: MultiSliver(pushPinnedChildren: true, children: [
      DecoratedSliver(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(24)),
        sliver: SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                      TaskCard(task: tasks[index]),
                  childCount: tasks.length)),
        ),
      ),
    ]),
  );
}
