import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/presentation/components/popups/layout_popover.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';
import 'package:task_ease/features/tasks/presentation/bloc/task_layout_bloc.dart';

import '../../../features/tasks/domain/use_cases/task_use_cases.dart';
import '../../di/di.dart';
import '../bloc/user_bloc.dart';

class DashHeader extends StatelessWidget {
  const DashHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(right: 16, top: 50, bottom: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              bottomLeft: Radius.circular(32))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    AuthRepositoryImpl().signOut();
                  },
                  icon: SvgPicture.asset("assets/images/icons/hamburger.svg",
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodySmall!.color!,
                          BlendMode.srcIn))),


              Row(
                children: [
                  // Text("Vivianne"),
                  IconButton(
                      onPressed: () {
                        AuthRepositoryImpl().signOut();
                      },
                      icon: SvgPicture.asset("assets/images/icons/share.svg",
                          width: 28,
                          height: 28,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).textTheme.bodySmall!.color!,
                              BlendMode.srcIn))),
                  //  User Avatar
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, userState) {
                      return Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.onSecondary),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: userState is UserSuccess &&
                              userState.user.userAvatar != null
                              ? CachedNetworkImage(
                            imageUrl: userState.user.userAvatar!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          )
                              : UnconstrainedBox(
                            child: SvgPicture.asset(
                                "assets/images/icons/user.svg",
                                width: 24,
                                height: 4,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color!,
                                    BlendMode.srcIn)),
                          ),
                        ),
                      );
                    },
                  ),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: SvgPicture.asset("assets/images/icons/calendar.svg",
                  //         width: 28,
                  //         height: 28,
                  //         colorFilter: ColorFilter.mode(
                  //             Theme.of(context).textTheme.bodySmall!.color!,
                  //             BlendMode.srcIn))),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),

            child: Row(
              children: [
                Expanded(
                  child: Text("Dashboard",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            Theme.of(context).textTheme.titleLarge!.fontWeight,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TasksHeader extends StatelessWidget {
  const TasksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              bottomLeft: Radius.circular(32))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          SvgPicture.asset("assets/images/icons/task.svg",
              width: 40,
              height: 40,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodySmall!.color!,
                  BlendMode.srcIn)),
          Row(
            children: [
              Expanded(
                child: Text("Tasks",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight:
                          Theme.of(context).textTheme.titleLarge!.fontWeight,
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    )),
              ),
              IconButton(
                  onPressed: () {
                    final taskUseCases = locator.get<TaskUseCases>();

                    taskUseCases.clearTasksInHive.call();
                  },
                  icon: SvgPicture.asset("assets/images/icons/filter.svg",
                      width: 26,
                      height: 26,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodyMedium!.color!,
                          BlendMode.srcIn))),
              Builder(builder: (layoutContext) {
                return IconButton(
                    onPressed: () {
                      showLayoutPopOver(layoutContext, onSelected: (layout) {
                        //  populate this to bloc
                        BlocProvider.of<TaskLayoutBloc>(context)
                            .add(ToggleTaskLayoutEvent(layout: layout));
                      });
                    },
                    icon: SvgPicture.asset("assets/images/icons/layout.svg",
                        width: 26,
                        height: 26,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).textTheme.bodyMedium!.color!,
                            BlendMode.srcIn)));
              })
            ],
          )
        ],
      ),
    );
  }
}

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32),
              bottomLeft: Radius.circular(32))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          SvgPicture.asset("assets/images/icons/calendar.svg",
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodySmall!.color!,
                  BlendMode.srcIn)),
          Row(
            children: [
              Expanded(
                child: Text("Calendar",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight:
                          Theme.of(context).textTheme.titleLarge!.fontWeight,
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    )),
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/images/icons/filter.svg",
                      width: 28,
                      height: 28,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).textTheme.bodyMedium!.color!,
                          BlendMode.srcIn)))
            ],
          )
        ],
      ),
    );
  }
}
