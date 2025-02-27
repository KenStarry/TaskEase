import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/features/dashboard/presentation/model/bottom_nav_item_model.dart';

class Dashboard extends StatefulWidget {
  final Widget child;

  const Dashboard({super.key, required this.child});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final List<BottomNavItemModel> _items;

  @override
  void initState() {
    super.initState();

    _items = [
      BottomNavItemModel(title: "Home", asset: "assets/images/icons/home.svg"),
      BottomNavItemModel(title: "Tasks", asset: "assets/images/icons/task.svg"),
      BottomNavItemModel(
          title: "Boards", asset: "assets/images/icons/board.svg"),
      BottomNavItemModel(
          title: "Settings", asset: "assets/images/icons/settings.svg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 75,
        margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Row(
          children: _items
              .map((item) => Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(item.asset,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).textTheme.bodySmall!.color!,
                              BlendMode.srcIn)),
                      Text(item.title,
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  )))
              .toList(),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
