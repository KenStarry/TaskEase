import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_ease/core/util/theme/colors.dart';
import 'package:task_ease/features/auth/presentation/bloc/google_sign_in_bloc.dart';
import 'package:task_ease/features/onboarding/presentation/model/onboarding_card_model.dart';

import '../../../../core/presentation/components/popups/theme_popover.dart';
import '../../../settings/presentation/theme_bloc.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late final List<OnboardingCardModel> _cards;
  ValueNotifier<int> activeIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();

    _cards = [
      OnboardingCardModel(
          title: "Stay Organized, Stay Productive",
          description: "📌 Keep track of all your tasks in one place and never miss a deadline.",
          asset: "assets/images/undraw/productive.svg"),
      OnboardingCardModel(
          title: "Collaborate with Ease",
          description: "👥 Share tasks with teammates, friends, or family for better teamwork.",
          asset: "assets/images/undraw/community.svg"),
      OnboardingCardModel(
          title: "Dark Mode & Themes",
          description: "🌙 Personalize your experience with dark mode and beautiful themes.",
          asset: "assets/images/undraw/theme.svg"),
      OnboardingCardModel(
          title: "Sync Across Devices",
          description: "📱 Access your tasks anytime, anywhere with seamless cloud sync.",
          asset: "assets/images/undraw/sync.svg"),
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
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                  child: CarouselSlider(
                      items: _cards
                          .map((card) => Container(
                                width: double.infinity,
                                height: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 24,
                                  children: [
                                    SvgPicture.asset(card.asset,
                                        width: 250, height: 250),
                                    Text(card.title,
                                        textAlign: TextAlign.center,
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
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          height: double.infinity,
                          autoPlay: true,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        activeIndex.value = index;
                      }))),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 32,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: activeIndex,
                        builder: (BuildContext context, int value, Widget? child) => DotsIndicator(dotsCount: _cards.length,
                        position: value.toDouble(),
                        decorator: DotsDecorator(
                          activeColor: Theme.of(context).colorScheme.primary,
                          activeSize: Size(30, 5),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        ),),
                      ),
                    ),
                    Column(
                      spacing: 24,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color!
                                    .withValues(alpha: 0.5),
                                thickness: 2,
                              ),
                            ),
                            Expanded(
                              child: Text("Continue with",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color!
                                    .withValues(alpha: 0.5),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.pushNamed('login');
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                child: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    "assets/images/icons/email.svg",
                                    width: 25,
                                    height: 25,
                                    colorFilter: ColorFilter.mode(
                                        Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                        BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<GoogleSignInBloc>(context)
                                    .add(GoogleSignInUserEvent());
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                child: UnconstrainedBox(
                                  child: Image.asset(
                                    "assets/images/icons/google.png",
                                    width: 25,
                                    height: 25,
                                    // color: Theme.of(context).colorScheme.onTertiary,
                                    // colorBlendMode: BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                        "By continuing you agree to our Terms of Service and Privacy Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.bodySmall!.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.bodySmall!.fontWeight,
                          color: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .color!
                              .withValues(alpha: 0.5),
                        )),
                    SizedBox(height: 24)
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
