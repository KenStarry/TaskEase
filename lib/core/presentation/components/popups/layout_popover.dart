import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:popover/popover.dart';
import 'package:task_ease/core/model/board_model.dart';
import 'package:task_ease/core/presentation/components/task_radio.dart';

import '../../../model/enum/layouts_enum.dart';
import '../../../util/theme/colors.dart';

void showLayoutPopOver(BuildContext context,
        {required Function(Layout layout) onSelected}) =>
    showPopover(
        context: context,
        bodyBuilder: (context) => Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(24)),
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                slivers: [
                  SliverToBoxAdapter(
                    child: Text("Choose Layout",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => GestureDetector(
                                onTap: () {
                                  onSelected(Layout.values[index]);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 8,
                                    children: [
                                      Expanded(
                                          child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              width: 3),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                        ),
                                        child: SvgPicture.asset(
                                            "assets/images/icons/${Layout.values[index].name}.svg",
                                            width: 50,
                                            height: 50,
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .color!
                                                    .withValues(alpha: 0.6),
                                                BlendMode.srcIn)),
                                      )),
                                      Text(Layout.values[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall)
                                    ],
                                  ),
                                ),
                              ),
                          childCount: Layout.values.length),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 100,
                          mainAxisExtent: 130,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16))
                ],
              ),
            ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        barrierDismissible: true,
        radius: 22,
        width: 230,
        height: 300,
        direction: PopoverDirection.bottom);
