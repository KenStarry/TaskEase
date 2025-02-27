import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/presentation/components/pill.dart';
import 'package:task_ease/core/util/extensions/color_extensions.dart';

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
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.only(left: 64, right: 64),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xff616771),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.only(left: 32, right: 32, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xff555B65),
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 2,
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
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .color!
                                        .withValues(alpha: 0.7))),
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
                            Text("You are soo close. Keep Going! 🎉",
                                style: TextStyle(
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
                                        .titleSmall!
                                        .color!
                                        .withValues(alpha: 0.7))),
                          ],
                        )),
                    Expanded(
                      child: CircularPercentIndicator(
                          radius: 35,
                          percent: 0.6,
                          fillColor: Colors.transparent,
                          arcBackgroundColor: Theme.of(context).colorScheme.onSecondary,
                          arcType: ArcType.FULL,
                          progressColor: Theme.of(context).colorScheme.primary,
                          circularStrokeCap: CircularStrokeCap.round,
                          lineWidth: 8,
                          center: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              "assets/images/icons/gold.svg",
                              width: double.infinity,
                              height: double.infinity,
                              colorFilter: ColorFilter.mode(
                                  true ?Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.2) : Theme.of(context).colorScheme.primary,
                                  BlendMode.srcIn),
                            ),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
