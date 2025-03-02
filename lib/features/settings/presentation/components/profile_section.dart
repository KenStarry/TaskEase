import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/di/di.dart';
import 'package:task_ease/core/model/use_cases/core_use_cases.dart';
import 'package:task_ease/features/tasks/presentation/bloc/tasks_bloc.dart';

import '../../../../core/presentation/bloc/user_bloc.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return SliverPadding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
          sliver: MultiSliver(children: [
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 30),
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
                ),
                Text(
                    userState is UserSuccess ? userState.user.userName : 'User',
                    style: Theme.of(context).textTheme.titleMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final useCases = locator.get<CoreUseCases>();
                        final tasksState = context.read<TasksBloc>().state;

                        await useCases.userUseCases.backupUserTasks.call(
                            tasks: tasksState is TasksSuccess
                                ? tasksState.allTasks
                                : []);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        child: UnconstrainedBox(
                          child: SvgPicture.asset(
                            "assets/images/icons/backup.svg",
                            width: 25,
                            height: 25,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.onTertiary,
                                BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        child: UnconstrainedBox(
                          child: SvgPicture.asset(
                            "assets/images/icons/moon.svg",
                            width: 25,
                            height: 25,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.onTertiary,
                                BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ))
          ]),
        );
      },
    );
  }
}
