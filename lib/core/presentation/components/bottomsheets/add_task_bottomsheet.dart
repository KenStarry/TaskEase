import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:popover/popover.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/presentation/components/custom_text_field.dart';
import 'package:task_ease/core/presentation/components/popups/board_popover.dart';
import 'package:task_ease/core/presentation/components/popups/calendar_popover.dart';
import 'package:task_ease/core/presentation/components/task_card.dart';
import 'package:task_ease/core/presentation/components/task_radio.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';
import 'package:task_ease/core/util/theme/colors.dart';

import '../../../model/board_model.dart';

class AddTaskBottomsheet extends StatefulWidget {
  const AddTaskBottomsheet({super.key});

  @override
  State<AddTaskBottomsheet> createState() => _AddTaskBottomsheetState();
}

class _AddTaskBottomsheetState extends State<AddTaskBottomsheet> {
  final TextEditingController taskController = TextEditingController();

  ValueNotifier<DateTime?> pickedDate = ValueNotifier(null);
  ValueNotifier<BoardModel?> pickedBoard = ValueNotifier(null);

  List<TextEditingController> subTasks = [];

  late final List<BoardModel> _boards;

  @override
  void initState() {
    super.initState();

    _boards = [
      BoardModel(
          boardId: "1",
          boardName: "Flutter",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
      BoardModel(
          boardId: "1",
          boardName: "Shopping",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
      BoardModel(
          boardId: "1",
          boardName: "Interview",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
      BoardModel(
          boardId: "1",
          boardName: "Personal",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
    ];
  }

  Widget control({required String asset, required VoidCallback onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onSecondary),
          child: Center(
            child: SvgPicture.asset(asset,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).textTheme.titleLarge!.color!,
                    BlendMode.srcIn)),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                    controller: taskController,
                    filledColor: Colors.transparent,
                    autoFocus: true,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    contentPadding: EdgeInsets.zero,
                    maxLines: null,
                    hintStyle: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withValues(alpha: 0.5),
                    ),
                    borderColor: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withValues(alpha: 0),
                    hintText: "I'm going to..."),
              ),

              SizedBox(height: 16),

              //  date
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  child: Row(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //  Picked Date
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          SvgPicture.asset("assets/images/icons/calendar.svg",
                              width: 12,
                              height: 12,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).textTheme.titleLarge!.color!,
                                  BlendMode.srcIn)),
                          ValueListenableBuilder(
                            valueListenable: pickedDate,
                            builder: (BuildContext context, DateTime? date,
                                    Widget? child) =>
                                Text(
                                    date
                                            ?.toString()
                                            .formatDate(format: "dd MMM, yyyy") ??
                                        'No Date',
                                    style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ],
                      ),

                      //  Priority
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).colorScheme.onSecondary),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            SvgPicture.asset("assets/images/icons/priority.svg",
                                width: 12,
                                height: 12,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).colorScheme.primary,
                                    BlendMode.srcIn)),
                            Text("1", style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),

                      //  Board
                      ValueListenableBuilder(
                        valueListenable: pickedBoard,
                        builder: (BuildContext context, BoardModel? value,
                                Widget? child) =>
                            value == null
                                ? SizedBox.shrink()
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      spacing: 8,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/images/icons/board.svg",
                                            width: 12,
                                            height: 12,
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                BlendMode.srcIn)),
                                        Text(value.boardName ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall),
                                      ],
                                    ),
                                  ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

              //  controlls
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12,
                  children: [
                    control(
                        asset: "assets/images/icons/calendar.svg",
                        onTap: () {
                          showCalendarPopOver(context, onValueChanged: (dates) {
                            pickedDate.value = dates[0];
                            Navigator.pop(context);
                          });
                        }),
                    control(
                        asset: "assets/images/icons/priority.svg", onTap: () {}),
                    control(
                        asset: "assets/images/icons/board.svg",
                        onTap: () {
                          showBoardPopOver(context,
                              selectedBoard: pickedBoard.value?.boardName,
                              boards: _boards, onSelected: (board) {
                            pickedBoard.value = board;
                          });
                        }),
                  ],
                ),
              ),

              SizedBox(height: 8),

              //  subtasks
              UnconstrainedBox(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        subTasks.add(TextEditingController());
                      });
                    },
                    style: TextButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).textTheme.bodyMedium!.color!),
                    child: Row(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/icons/subtask.svg",
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).textTheme.bodyMedium!.color!,
                                BlendMode.srcIn)),
                        Text("Add Subtask",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    )),
              ),

              SizedBox(height: 8),

              /// Subtasks Section
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    child: Column(
                      children: subTasks.map((controller) => Row(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TaskRadio(size: Size(20, 20)),
                          Expanded(child: CustomTextField(
                              controller: controller,
                              filledColor: Colors.transparent,
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                              contentPadding: EdgeInsets.zero,
                              autoFocus: true,
                              maxLines: null,
                              hintStyle: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                                fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!
                                    .withValues(alpha: 0.5),
                              ),
                              borderColor: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!
                                  .withValues(alpha: 0),
                              onFieldSubmitted: (text) {
                                setState(() {
                                  subTasks.add(TextEditingController());
                                });
                              },
                              hintText: "I also want to..."),),
                          IconButton(onPressed: (){
                            setState(() {
                              subTasks.removeWhere((taskController) => taskController == controller);
                            });
                          }, icon: SvgPicture.asset("assets/images/icons/close.svg", width: 24, height: 24,
                          colorFilter: ColorFilter.mode(Theme.of(context).textTheme.bodyMedium!.color!, BlendMode.srcIn)))
                        ],
                      )).toList(),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor:
                              Theme.of(context).colorScheme.primary),
                          child: Text("Cancel",
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                                fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
                                color: Theme.of(context).textTheme.bodyMedium!.color,
                              ))),

                      UnconstrainedBox(
                        child: TextButton(
                            onPressed: () {
                                final newTaskList = [
                                  TaskModel(taskName: taskController.text)
                                ];
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                                foregroundColor:
                                Theme.of(context).textTheme.bodyMedium!.color!),
                            child: Row(
                              spacing: 4,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/images/icons/add.svg",
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                        Theme.of(context).textTheme.bodyMedium!.color!,
                                        BlendMode.srcIn)),
                                Text("Add",
                                    style: Theme.of(context).textTheme.bodyMedium),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24)
            ],
          ),
        ),
      ),
    );
  }
}
