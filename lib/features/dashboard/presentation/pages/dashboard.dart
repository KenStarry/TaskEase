import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_ease/core/presentation/bloc/user_bloc.dart';
import 'package:task_ease/core/presentation/components/bottomsheets/add_task_bottomsheet.dart';
import 'package:task_ease/core/util/theme/colors.dart';
import 'package:task_ease/features/dashboard/presentation/model/bottom_nav_item_model.dart';

import '../../../settings/presentation/theme_bloc.dart';

class Dashboard extends StatefulWidget {
  final Widget child;

  const Dashboard({super.key, required this.child});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final List<BottomNavItemModel> _items;

  ValueNotifier<int> activeIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();

    _items = [
      BottomNavItemModel(title: "Home", asset: "assets/images/icons/home.svg"),
      BottomNavItemModel(title: "Tasks", asset: "assets/images/icons/task.svg"),
      BottomNavItemModel(
          title: "Calendar", asset: "assets/images/icons/calendar.svg"),
      BottomNavItemModel(
          title: "Settings", asset: "assets/images/icons/settings.svg"),
    ];

    BlocProvider.of<UserBloc>(context).add(FetchUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return AnnotatedRegion(
          value: SystemUiOverlayStyle(
              statusBarIconBrightness: themeState is ThemeDarkMode
                  ? Brightness.light
                  : themeState is ThemeLightMode
                      ? Brightness.dark
                      : null,
              statusBarColor: Colors.transparent,
              systemNavigationBarColor:
                  Theme.of(context).colorScheme.onSecondary),
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useRootNavigator: true,
                        builder: (context) => AddTaskBottomsheet());
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/icons/add.svg",
                          width: 32,
                          height: 32,
                          colorFilter:
                              ColorFilter.mode(Theme.of(context).textTheme.titleSmall!.color!, BlendMode.srcIn)),
                    ),
                  ),
                ),
                bottomNavigationBar: ValueListenableBuilder(
                  valueListenable: activeIndex,
                  builder: (BuildContext context, int active, Widget? child) =>
                      AnimatedBottomNavigationBar.builder(
                          itemCount: _items.length,
                          tabBuilder: (index, isActive) => isActive
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(_items[index].asset,
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            BlendMode.srcIn)),
                                    Text(_items[index].title,
                                        style: TextStyle(
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .fontWeight,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary))
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset(_items[index].asset,
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(
                                            Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .color!,
                                            BlendMode.srcIn)),
                                    Text(_items[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall)
                                  ],
                                ),
                          activeIndex: active,
                          gapLocation: GapLocation.center,
                          scaleFactor: 0,
                          height: 70,
                          splashColor: Colors.transparent,
                          splashRadius: 0,
                          leftCornerRadius: 32,
                          rightCornerRadius: 32,
                          backgroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          onTap: (index) {
                            activeIndex.value = index;
                            switch (_items[index].title) {
                              case 'Home':
                                context.pushNamed('home');
                                break;
                              case 'Tasks':
                                context.pushNamed('tasks');
                                break;
                              case 'Calendar':
                                context.pushNamed('calendar');
                                break;
                              case 'Settings':
                                context.pushNamed('settings');
                                break;
                            }
                          }),
                ),
                body: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      widget.child,

                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Container(
                      //     width: double.infinity,
                      //     height: 75,
                      //     margin: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(24),
                      //       color: Color(0xff495057),
                      //       boxShadow: [
                      //         BoxShadow(color: blackColor.withValues(alpha: 0.2))
                      //       ]
                      //     ),
                      //     child: Row(
                      //       children: _items
                      //           .map((item) => Expanded(
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //             children: [
                      //               SvgPicture.asset(item.asset,
                      //                   width: 24,
                      //                   height: 24,
                      //                   colorFilter: ColorFilter.mode(
                      //                       Theme.of(context).textTheme.bodySmall!.color!,
                      //                       BlendMode.srcIn)),
                      //               Text(item.title,
                      //                   style: Theme.of(context).textTheme.bodySmall)
                      //             ],
                      //           )))
                      //           .toList(),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),

              // Container(
              //   width: double.infinity,
              //   height: double.infinity,
              //   decoration: BoxDecoration(
              //     color: blackColor.withValues(alpha: 0.6)
              //   ),
              //   child: Align(
              //       alignment: Alignment.bottomCenter,
              //       child: Container(
              //         width: double.infinity,
              //         height: context.screenHeight * 0.45,
              //         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(24),
              //           color: Colors.red,
              //         ),
              //       )
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
