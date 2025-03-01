import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';
import 'package:task_ease/core/util/svg/complete_task_svg_parse.dart';

import '../../../../../core/presentation/components/task_card.dart';

List<Widget> tasksByDate(BuildContext context,
    {required List<String?> allDates, required List<TaskModel> tasks}) {
  return tasks.isEmpty ? [
    SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            const SizedBox(height: 30),
            UnconstrainedBox(
              child: SvgPicture.string(
                completeTaskSvgParse(context), width: 250, height: 250,),
            ),

            const SizedBox(height: 24),

            Text("Nothing left?\nSurely there's more to conquer! ⚡")
          ],
        ),
      ),
    )
  ] : allDates.map((date) {
    final allTasksUnderDate = tasks
        .where((task) =>
    task.taskParentId == null &&
        (task.taskDate?.formatDate(format: 'dd LLL yyyy')) == date)
        .toList();

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: MultiSliver(pushPinnedChildren: true, children: [
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverPinnedHeader(
            child: Container(
              width: double.infinity,
              height: 24,
              color: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  date ==
                      DateTime.now()
                          .toString()
                          .formatDate(format: 'dd LLL yyyy')
                      ? 'Today'
                      : (date ?? 'No Date'),
                  style: TextStyle(
                    fontSize: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium!
                        .fontSize,
                    fontWeight: Theme
                        .of(context)
                        .textTheme
                        .titleLarge!
                        .fontWeight,
                    color: Theme
                        .of(context)
                        .textTheme
                        .titleLarge!
                        .color,
                  ),
                ),
              ),
            )),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        DecoratedSliver(
          decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onSecondary,
              borderRadius: BorderRadius.circular(24)),
          sliver: SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                        TaskCard(task: allTasksUnderDate[index]),
                    childCount: allTasksUnderDate.length)),
          ),
        ),
      ]),
    );
  }).toList();
}
