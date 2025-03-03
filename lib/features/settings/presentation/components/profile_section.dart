import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/di/di.dart';
import 'package:task_ease/core/model/use_cases/core_use_cases.dart';
import 'package:task_ease/core/presentation/bloc/backup_bloc.dart';
import 'package:task_ease/core/presentation/components/snackbars/show_error_snackbar.dart';
import 'package:task_ease/core/presentation/components/snackbars/show_success_snackbar.dart';
import 'package:task_ease/features/tasks/presentation/bloc/tasks_bloc.dart';

import '../../../../core/presentation/bloc/user_bloc.dart';
import '../../../../core/presentation/components/popups/theme_popover.dart';
import '../theme_bloc.dart';

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
                            errorWidget: (context, url, error) =>
                                UnconstrainedBox(
                              child: SvgPicture.asset(
                                  "assets/images/icons/user.svg",
                                  width: 35,
                                  height: 35,
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color!,
                                      BlendMode.srcIn)),
                            ),
                          )
                        : UnconstrainedBox(
                            child: SvgPicture.asset(
                                "assets/images/icons/user.svg",
                                width: 35,
                                height: 35,
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
                    BlocConsumer<BackupBloc, BackupState>(
                      builder: (context, backupState) {
                        return GestureDetector(
                          onTap: backupState is BackupLoading
                              ? null
                              : () async {
                                  final tasksState =
                                      context.read<TasksBloc>().state;

                                  BlocProvider.of<BackupBloc>(context).add(
                                      BackupToFirebaseEvent(
                                          allTasks: tasksState is TasksSuccess
                                              ? tasksState.allTasks
                                              : []));
                                },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            child: backupState is BackupLoading
                                ? SpinKitFadingCircle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 24,
                                  )
                                : UnconstrainedBox(
                                    child: SvgPicture.asset(
                                      "assets/images/icons/backup.svg",
                                      width: 25,
                                      height: 25,
                                      colorFilter: ColorFilter.mode(
                                          Theme.of(context)
                                              .colorScheme
                                              .onTertiary,
                                          BlendMode.srcIn),
                                    ),
                                  ),
                          ),
                        );
                      },
                      listener: (BuildContext context, BackupState state) {
                        if (state is BackupSuccess) {
                          showSuccessSnackbar(context,
                              title: "Backed up successful",
                              message:
                                  "Your tasks have been backed up successfully!");
                        }

                        if (state is BackupFailed) {
                          showErrorSnackbar(context,
                              title: "Oops!",
                              message:
                                  "Sorry, something went wrong and we could not backup your data");
                        }
                      },
                    ),
                    SizedBox(width: 16),
                    BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, themeState) {
                        return Builder(builder: (themeContext) {
                          return GestureDetector(
                            onTap: () {
                              showThemePopOver(themeContext,
                                  onSelected: (theme) {
                                BlocProvider.of<ThemeBloc>(context)
                                    .add(ToggleThemeEvent(themeMode: theme));
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              child: UnconstrainedBox(
                                child: SvgPicture.asset(
                                  "assets/images/icons/${themeState is ThemeDarkMode ? 'sun' : 'moon'}.svg",
                                  width: 25,
                                  height: 25,
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.onTertiary,
                                      BlendMode.srcIn),
                                ),
                              ),
                            ),
                          );
                        });
                      },
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
