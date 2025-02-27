import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:task_ease/core/model/board_model.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeBoardsSection extends StatefulWidget {
  const HomeBoardsSection({super.key});

  @override
  State<HomeBoardsSection> createState() => _HomeBoardsSectionState();
}

class _HomeBoardsSectionState extends State<HomeBoardsSection> {
  late final List<BoardModel> _boards;

  @override
  void initState() {
    super.initState();

    _boards = [
      BoardModel(
          boardId: "1",
          boardName: "Flutter",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
      BoardModel(
          boardId: "1",
          boardName: "Shopping",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
      BoardModel(
          boardId: "1",
          boardName: "Interview",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
      BoardModel(
          boardId: "1",
          boardName: "Personal",
          boardDescription: "Flutter Projects",
          boardHexColor: null),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiSliver(children: [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
              child: Text("Boards",
                  style: Theme.of(context).textTheme.titleSmall))),
      SliverToBoxAdapter(child: SizedBox(height: 24)),
      SliverToBoxAdapter(
        child: Container(
          width: double.infinity,
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: GridView.custom(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverQuiltedGridDelegate(
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    crossAxisCount: 10,
                    // columns
                    pattern: [
                      QuiltedGridTile(5, 5), // First tile (7 columns, 10 rows)
                      QuiltedGridTile(10, 5), // Second tile (2 rows, 2 columns)
                      QuiltedGridTile(5, 5),
                    ],
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        LayoutBuilder(builder: (context, constraints) {
                          final board = _boards[index];

                          final svgPicture = Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/icons/grid.svg",
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!,
                                    BlendMode.srcIn),
                              ),
                            ),
                          );

                          final title = Text(board.boardName ?? '',
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontWeight,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .color,
                              ));

                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: BorderRadius.circular(24)),
                            child: constraints.maxWidth > constraints.maxHeight
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8),
                                    child: Row(
                                      spacing: 24,
                                      children: [
                                        /// Long Widget
                                        svgPicture,

                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 16,
                                          children: [
                                            title,
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              spacing: 8,
                                              children: [
                                                Text("2 / 5",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall),
                                                LinearPercentIndicator(
                                                  width: 100,
                                                  lineHeight: 8.0,
                                                  percent: 0.5,
                                                  barRadius:
                                                      Radius.circular(100),
                                                  padding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .onSecondary,
                                                  progressColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                ),
                                              ],
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        /// Box or Vertically Longer Container
                                        svgPicture,
                                        title,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 12,
                                          children: [
                                            Expanded(
                                              child: LinearPercentIndicator(
                                                width: 80,
                                                lineHeight: 8.0,
                                                percent: 0.5,
                                                barRadius: Radius.circular(100),
                                                padding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary,
                                                progressColor: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),
                                            Text("2 / 5",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                          );
                        }),
                    childCount: _boards.length)),
          ),
        ),
      )
    ]);
  }
}
