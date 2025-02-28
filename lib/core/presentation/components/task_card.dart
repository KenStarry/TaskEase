import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/model/task_model.dart';
import 'package:task_ease/core/presentation/components/task_radio.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

class TaskCard extends StatefulWidget {
  final TaskModel task;
  final EdgeInsets? margin;

  const TaskCard({super.key, required this.task, this.margin});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Widget _taskCardContent({required String asset, required String content}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 8,
        children: [
          SvgPicture.asset(asset,
              width: 16,
              height: 16,
              colorFilter: ColorFilter.mode(
                  Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .color!
                      .withValues(alpha: 0.6),
                  BlendMode.srcIn)),
          Text(content, style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
            fontWeight: Theme.of(context).textTheme.bodySmall!.fontWeight,
            color: Theme.of(context).textTheme.bodySmall!.color!.withValues(alpha: 0.6),
          ))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      margin: widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
      ),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TaskRadio(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Text(widget.task.taskName ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    _taskCardContent(
                        asset: "assets/images/icons/calendar.svg",
                        content: (widget.task.taskDate?.toString().formatDate(format: "dd MMM, yy")) ?? "No date"),
                    _taskCardContent(
                        asset: "assets/images/icons/priority.svg",
                        content: "1"),
                    _taskCardContent(
                        asset: "assets/images/icons/subtask.svg", content: "3"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
