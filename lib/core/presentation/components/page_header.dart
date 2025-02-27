import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extend/flutter_extend.dart';
import 'package:flutter_svg/svg.dart';

class PageHeader extends StatefulWidget {
  const PageHeader({super.key});

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                bottomLeft: Radius.circular(32))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/images/icons/share.svg",
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).textTheme.bodySmall!.color!,
                            BlendMode.srcIn))),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/images/icons/calendar.svg",
                        width: 28,
                        height: 28,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).textTheme.bodySmall!.color!,
                            BlendMode.srcIn))),
                const SizedBox(width: 8),
                Container(
                  width: 50,
                  height: 50,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://plus.unsplash.com/premium_photo-1675034796201-35c8f064ba29?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ).clip(borderRadius: BorderRadius.circular(100)),
                )
              ],
            ),
            Text("Dashboard",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight:
                      Theme.of(context).textTheme.titleLarge!.fontWeight,
                  color: Theme.of(context).textTheme.titleLarge!.color,
                ))
          ],
        ),
      ),
    );
  }
}
