import 'package:flutter/material.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

class ActivityCard extends StatefulWidget {
  const ActivityCard({super.key});

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 3 / 2.7,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              margin: const EdgeInsets.only(left: 16, right: 16, top: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: Theme.of(context).colorScheme.onSecondary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Activity",
                              style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                                  fontWeight: Theme.of(context).textTheme.titleMedium!.fontWeight,
                                  color: Theme.of(context).textTheme.titleMedium!.color)),
                          Text(DateTime.now().toString().formatDate(format: 'dd MMMM, yyyy'),
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(right: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
