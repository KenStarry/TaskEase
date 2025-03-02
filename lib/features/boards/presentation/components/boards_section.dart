import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/model/board_model.dart';
import '../../../../core/presentation/bloc/user_bloc.dart';

class BoardsSection extends StatefulWidget {
  const BoardsSection({super.key});

  @override
  State<BoardsSection> createState() => _BoardsSectionState();
}

class _BoardsSectionState extends State<BoardsSection> {
  late final List<BoardModel> _boards;

  @override
  void initState() {
    super.initState();

    _boards = [
      BoardModel(
          boardId: "1",
          boardName: "Flutter",
          boardDescription: "Flutter Projects",
          boardHexColor: "#FE4242"),
      BoardModel(
          boardId: "1",
          boardName: "Shopping",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
      BoardModel(
          boardId: "1",
          boardName: "Interview",
          boardDescription: "Flutter Projects",
          boardHexColor: "#FF0000"),
      BoardModel(
          boardId: "1",
          boardName: "Personal",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) {
                final board = _boards[index];
                return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: AspectRatio(
                      aspectRatio: 3 / 1.4,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16,
                        vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        child: Row(
                          spacing: 16,
                          children: [
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 16,
                              children: [
                                Text(board.boardName ?? '', style: TextStyle(
                                  fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
                                  fontWeight: Theme.of(context).textTheme.titleSmall!.fontWeight,
                                  color: Theme.of(context).textTheme.titleSmall!.color,
                                )),

                                Container(
                                  width: double.infinity,
                                  height: 30,
                                  child: Stack(
                                    children: [
                                      BlocBuilder<UserBloc, UserState>(
                                        builder: (context, userState) {
                                          return Container(
                                            width: 25,
                                            height: 25,
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
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                            CircularPercentIndicator(
                                radius: 35,
                                percent: 0.6,
                                fillColor: Colors.transparent,
                                animateToInitialPercent: true,
                                animationDuration: 2000,
                                animation: true,
                                arcBackgroundColor: Theme.of(context).colorScheme.onSecondary,
                                arcType: ArcType.FULL,
                                progressColor: board.boardHexColor?.toColor() ?? Theme.of(context).colorScheme.primary,
                                circularStrokeCap: CircularStrokeCap.round,
                                lineWidth: 8,
                                center: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    "assets/images/icons/success.svg",
                                    width: double.infinity,
                                    height: double.infinity,
                                    colorFilter: ColorFilter.mode(
                                        true ?Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.2) : Theme.of(context).colorScheme.primary,
                                        BlendMode.srcIn),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
              );
              },
              childCount: _boards.length)),
    );
  }
}
