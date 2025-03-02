import 'package:flutter/material.dart';
import 'package:task_ease/features/settings/presentation/components/activity_card.dart';
import 'package:task_ease/features/settings/presentation/components/profile_section.dart';
import 'package:task_ease/features/settings/presentation/components/setting_section.dart';
import 'package:task_ease/features/settings/presentation/model/setting_card_model.dart';

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
            SettingSection(
              settingTitle: "Appearance",
              settingCards: [
                SettingCardModel(
                    title: "Theme", icon: "assets/images/icons/theme.svg"),
                SettingCardModel(
                    title: "Layouts and Navigation",
                    icon: "assets/images/icons/layout.svg"),
              ],
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SettingSection(
              settingTitle: "Productivity",
              settingCards: [
                SettingCardModel(
                    title: "Productivity", icon: "assets/images/icons/productivity.svg"),
                SettingCardModel(
                    title: "Reminders", icon: "assets/images/icons/reminder.svg"),
                SettingCardModel(
                    title: "Notifications",
                    icon: "assets/images/icons/notification.svg"),
              ],
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SettingSection(
              settingTitle: "More",
              settingCards: [
                SettingCardModel(
                    title: "Support", icon: "assets/images/icons/info.svg"),
                SettingCardModel(
                    title: "About", icon: "assets/images/icons/info.svg"),
                SettingCardModel(
                    title: "Changelog",
                    icon: "assets/images/icons/notification.svg"),
              ],
            ),
            SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
