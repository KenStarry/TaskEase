import 'package:flutter/material.dart';

class TaskRadio extends StatefulWidget {
  final bool isActive;
  final Size? size;
  const TaskRadio({super.key, this.size, this.isActive = false});

  @override
  State<TaskRadio> createState() => _TaskRadioState();
}

class _TaskRadioState extends State<TaskRadio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size?.width ?? 25,
      height: widget.size?.height ?? 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2)),
    );
  }
}
