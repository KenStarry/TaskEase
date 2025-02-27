import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeBoardsSection extends StatefulWidget {
  const HomeBoardsSection({super.key});

  @override
  State<HomeBoardsSection> createState() => _HomeBoardsSectionState();
}

class _HomeBoardsSectionState extends State<HomeBoardsSection> {
  @override
  Widget build(BuildContext context) {
    return MultiSliver(children: [
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
                    (context, index) => LayoutBuilder(
                        builder: (context, constraints) => Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: BorderRadius.circular(24)),
                              child:
                                  constraints.maxWidth > constraints.maxHeight
                                      ? Row(
                                          children: [
                                            /// Long Widget
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            /// Box or Vertically Longer Container
                                          ],
                                        ),
                            )),
                    childCount: 100)),
          ),
        ),
      )
    ]);
  }
}
