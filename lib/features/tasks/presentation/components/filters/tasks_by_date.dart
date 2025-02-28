import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

import '../../../../../core/presentation/components/task_card.dart';


List<Widget> tasksByDate(BuildContext context,
    {required List<String> allDates, required List<TaskModel> tasks}) {
  return allDates.map((date) {
    final allTasksUnderDate = tasks
        .where((task) => (task.taskDate?.formatDate(format: 'dd LLL yyyy') ?? 'No Date') == date)
        .toList();

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: MultiSliver(pushPinnedChildren: true, children: [
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverPinnedHeader(
            child: Container(
          width: double.infinity,
          height: 24,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              date == DateTime.now().toString().formatDate(format: 'dd LLL yyyy')
                  ? 'Today'
                  : date,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                fontWeight: Theme.of(context).textTheme.titleLarge!.fontWeight,
                color: Theme.of(context).textTheme.titleLarge!.color,
              ),
            ),
          ),
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        DecoratedSliver(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(24)),
          sliver: SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => TaskCard(task: allTasksUnderDate[index]),
                    childCount: allTasksUnderDate.length)),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ]),
    );
  }).toList();
}
