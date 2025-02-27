import 'package:flutter/material.dart';
import 'package:task_ease/core/presentation/components/page_header.dart';
import 'package:task_ease/features/home/presentation/components/home_daily_goal_section.dart';
import 'package:task_ease/features/home/presentation/components/home_tasks_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// Header
            SliverToBoxAdapter(child: PageHeader()),

            SliverToBoxAdapter(child: SizedBox(height: 24)),

            HomeDailyGoalSection(),

            SliverToBoxAdapter(child: SizedBox(height: 24)),

            HomeTasksSection()
          ],
        ),
      ),
    );
  }
}
