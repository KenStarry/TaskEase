import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/presentation/components/pill.dart';

import '../../../../core/util/theme/colors.dart';

class HomeDailyGoalSection extends StatefulWidget {
  const HomeDailyGoalSection({super.key});

  @override
  State<HomeDailyGoalSection> createState() => _HomeDailyGoalSectionState();
}

class _HomeDailyGoalSectionState extends State<HomeDailyGoalSection> {
  @override
  Widget build(BuildContext context) {
    return MultiSliver(children: [
      // /// Header
      // SliverPadding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   sliver: SliverToBoxAdapter(
      //     child: Text("Goals",
      //         style: TextStyle(
      //             fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
      //             fontWeight:
      //                 Theme.of(context).textTheme.bodyMedium!.fontWeight,
      //             color: Theme.of(context).textTheme.titleSmall!.color)),
      //   ),
      // ),
      //
      // SliverToBoxAdapter(child: SizedBox(height: 24)),

      /// Goals container
      SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 3 / 1.4,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Text("Daily Goal",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontWeight,
                            color:
                                Theme.of(context).textTheme.titleSmall!.color!.withValues(alpha: 0.7))),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Pill(text: "3/5"),
                        Text(
                          "tasks",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .fontWeight,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color),
                        ),
                      ],
                    ),

                    Text("You are soo close. Keep closing the tasks!",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontWeight,
                            color:
                            Theme.of(context).textTheme.titleSmall!.color!.withValues(alpha: 0.7))),
                  ],
                ))
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
