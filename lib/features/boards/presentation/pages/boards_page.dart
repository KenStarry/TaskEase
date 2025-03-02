import 'package:flutter/material.dart';
import 'package:task_ease/features/boards/presentation/components/boards_section.dart';

import '../../../../core/model/board_model.dart';
import '../../../../core/presentation/components/page_header.dart';

class BoardsPage extends StatefulWidget {
  const BoardsPage({super.key});

  @override
  State<BoardsPage> createState() => _BoardsPageState();
}

class _BoardsPageState extends State<BoardsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: BoardsHeader()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          BoardsSection(),
          SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      )
    );
  }
}
