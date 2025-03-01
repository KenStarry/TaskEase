import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/util/theme/colors.dart';
import 'package:task_ease/features/onboarding/presentation/model/onboarding_card_model.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late final List<OnboardingCardModel> _cards;

  @override
  void initState() {
    super.initState();

    _cards = [
      OnboardingCardModel(
          title: "Manage Tasks",
          description: "Manage all your scheduled tasks",
          asset: "assets/images/undraw/community.svg"),
      OnboardingCardModel(
          title: "Manage Tasks",
          description: "Manage all your scheduled tasks",
          asset: "assets/images/undraw/community.svg"),
      OnboardingCardModel(
          title: "Manage Tasks",
          description: "Manage all your scheduled tasks",
          asset: "assets/images/undraw/community.svg"),
      OnboardingCardModel(
          title: "Manage Tasks",
          description: "Manage all your scheduled tasks",
          asset: "assets/images/undraw/community.svg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                  child: CarouselSlider(
                      items: _cards
                          .map((card) => Container(
                                width: double.infinity,
                                height: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 32,
                                  children: [
                                    SvgPicture.asset(card.asset,
                                        width: 250, height: 250),
                                    Text(card.title,
                                        style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .fontSize,
                                          fontWeight: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .fontWeight,
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .color,
                                        )),

                                    Text(card.description,
                                        style: Theme.of(context).textTheme.bodyMedium),
                                  ],
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          height: double.infinity,
                          autoPlay: true,
                          viewportFraction: 1,
                          enableInfiniteScroll: false))),
              Container(
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.only(right: 16),
                // color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(onPressed: () {}, child: Text("Skip")),
                        FilledButton(
                            onPressed: () {},
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontSize,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .fontWeight,
                                color: whiteColor,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
