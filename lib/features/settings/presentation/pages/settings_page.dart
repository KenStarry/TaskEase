import 'package:flutter/material.dart';
import 'package:task_ease/features/settings/presentation/components/activity_card.dart';
import 'package:task_ease/features/settings/presentation/components/profile_section.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            ProfileSection(),

            SliverToBoxAdapter(child: SizedBox(height: 24)),

            ActivityCard()
          ],
        ),
      ),
    );
  }
}
