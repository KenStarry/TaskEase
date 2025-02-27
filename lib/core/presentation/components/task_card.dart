import 'package:flutter/material.dart';
import 'package:task_ease/core/model/task_model.dart';

class TaskCard extends StatefulWidget {
  final TaskModel task;
  final EdgeInsets? margin;

  const TaskCard({super.key, required this.task, this.margin});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 2)),
          ),
          Expanded(
            child: Text(widget.task.taskName ?? "",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
