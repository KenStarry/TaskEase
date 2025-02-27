import 'package:flutter/material.dart';
import 'package:task_ease/core/util/theme/colors.dart';

class Pill extends StatelessWidget {
  final String text;

  const Pill({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.secondary),
      child: Text(
        text,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
            color: whiteColor),
      ),
    );
  }
}
