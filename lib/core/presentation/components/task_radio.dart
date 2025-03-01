import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/util/theme/colors.dart';

class TaskRadio extends StatefulWidget {
  final bool isActive;
  final Size? size;
  final Function(bool selected)? onTap;

  const TaskRadio({super.key, this.size, this.isActive = false, this.onTap});

  @override
  State<TaskRadio> createState() => _TaskRadioState();
}

class _TaskRadioState extends State<TaskRadio> with TickerProviderStateMixin {
  ValueNotifier<bool> isSelected = ValueNotifier(false);
  AnimationController? tickController;

  @override
  void initState() {
    super.initState();

    tickController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   isSelected.value = widget.isActive;
    // });
  }

  @override
  Widget build(BuildContext context) {
    isSelected.value = widget.isActive;

    return GestureDetector(
      onTap: () async {
        isSelected.value = !isSelected.value;

        if (isSelected.value) {
          await tickController!.forward();
        } else {
          await tickController!.reverse();
        }

        widget.onTap!(isSelected.value);
      },
      child: ValueListenableBuilder(
        valueListenable: isSelected,
        builder: (BuildContext context, bool value, Widget? child) => Container(
          width: widget.size?.width ?? 25,
          height: widget.size?.height ?? 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 2)),
          child: value
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary),
                  child: SvgPicture.asset(
                    "assets/images/icons/check.svg",
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(whiteColor, BlendMode.srcIn),
                  ),
                )
              : SizedBox.shrink(),
        )
            .animate(
                autoPlay: false,
                onInit: (controller) =>
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        tickController = controller;
                      });
                    }))
            .scale(
                begin: Offset(1, 1),
                end: Offset(0.7, 0.7),
                duration: Duration(milliseconds: 150),
                curve: Curves.ease)
            .then()
            .scale(
                end: Offset(1.3, 1.3),
                duration: Duration(milliseconds: 150),
                curve: Curves.ease),
      ),
    );
  }
}
