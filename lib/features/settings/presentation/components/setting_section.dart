import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../model/setting_card_model.dart';

class SettingSection extends StatefulWidget {
  final String settingTitle;
  final List<SettingCardModel> settingCards;

  const SettingSection(
      {super.key, required this.settingTitle, required this.settingCards});

  @override
  State<SettingSection> createState() => _SettingSectionState();
}

class _SettingSectionState extends State<SettingSection> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: MultiSliver(children: [
        SliverToBoxAdapter(
            child: Text(widget.settingTitle,
                style: Theme.of(context).textTheme.bodyLarge)),

        SliverToBoxAdapter(child: SizedBox(height: 16)),
      
        // Add Sliver List of Widgets
        DecoratedSliver(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(24)),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => AspectRatio(
                    aspectRatio: 3 / 0.5,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        spacing: 16,
                        children: [
                          SvgPicture.asset(widget.settingCards[index].icon,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).textTheme.bodyMedium!.color!,
                                  BlendMode.srcIn)),
                          Expanded(
                              child: Text(widget.settingCards[index].title,
                                  style: Theme.of(context).textTheme.bodyMedium))
                        ],
                      ),
                    ),
                  ),
              childCount: widget.settingCards.length)),
        )
      ]),
    );
  }
}
