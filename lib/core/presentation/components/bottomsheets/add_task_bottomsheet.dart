import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/presentation/components/custom_text_field.dart';

class AddTaskBottomsheet extends StatefulWidget {
  const AddTaskBottomsheet({super.key});

  @override
  State<AddTaskBottomsheet> createState() => _AddTaskBottomsheetState();
}

class _AddTaskBottomsheetState extends State<AddTaskBottomsheet> {
  final TextEditingController taskController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   "Add Task",
            //   style: Theme.of(context).textTheme.titleSmall,
            // ),
            SizedBox(height: 16),

            CustomTextField(
                controller: taskController,
                filledColor: Colors.transparent,
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

            SizedBox(height: 16),

            //  date
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
                      Text("12 Jan, 2025", style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),

                  //  Priority
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.onSecondary
                    ),
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.onSecondary
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        SvgPicture.asset("assets/images/icons/board.svg",
                            width: 12,
                            height: 12,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.primary,
                                BlendMode.srcIn)),
                        Text("Shopping", style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            //  controlls
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 12,
              children: [
                control(asset: "assets/images/icons/calendar.svg", onTap: (){
                  // show
                }),
                control(asset: "assets/images/icons/priority.svg", onTap: (){}),
                control(asset: "assets/images/icons/board.svg", onTap: (){}),
              ],
            ),

            SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}
