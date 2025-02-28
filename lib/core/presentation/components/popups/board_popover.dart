import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:task_ease/core/model/board_model.dart';
import 'package:task_ease/core/presentation/components/task_radio.dart';

import '../../../util/theme/colors.dart';

void showBoardPopOver(BuildContext context,
        {required List<BoardModel> boards,
        required String? selectedBoard,
        required Function(BoardModel board) onSelected}) =>
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
                    child: Text("Select Board",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 12)),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => GestureDetector(
                                onTap: () {
                                  onSelected(boards[index]);
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
                                          isActive: selectedBoard != null &&
                                              selectedBoard ==
                                                  boards[index].boardName),
                                      Expanded(
                                        child: Text(
                                            boards[index].boardName ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          childCount: boards.length))
                ],
              ),
            ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        barrierDismissible: true,
        radius: 24,
        direction: PopoverDirection.top);
