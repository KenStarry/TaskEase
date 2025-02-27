import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomeTasksSection extends StatefulWidget {
  const HomeTasksSection({super.key});

  @override
  State<HomeTasksSection> createState() => _HomeTasksSectionState();
}

class _HomeTasksSectionState extends State<HomeTasksSection> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: MultiSliver(children: [
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Today", style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
                fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
                color: Theme.of(context).textTheme.titleSmall!.color
              )),
              SizedBox(
                width: 60,
                height: 60,
                child: CircularStepProgressIndicator(
                    totalSteps: 10,
                    currentStep: 3,
                    selectedStepSize: 3,
                    unselectedStepSize: 3,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    roundedCap: (index, isRound) => true,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.transparent),
                      child: Center(
                        child: Text("3/10", style: Theme.of(context).textTheme.bodySmall),
                      ),
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }
}
