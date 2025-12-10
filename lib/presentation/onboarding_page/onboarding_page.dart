import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:matreshka_vpn/core/constant/app_constant.dart';
import 'package:matreshka_vpn/widget/big_icon.dart';
import 'package:matreshka_vpn/widget/custom_scaffold_bg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageSize = MediaQuery.of(context).size.width * 0.6;
    List<PageViewModel> pages = [
      PageViewModel(
        title: "Включи защиту!",
        body:
            "Одним нажатием огромной кнопки вы активируете надежную защиту. Ваши данные — только ваши",
        image: Center(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(
              AppConstant.borederRadius,
            ),
            child: Image.asset(
              'assets/onboard1.png',
              height: imageSize * 1.5,
              width: imageSize,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      PageViewModel(
        title: "Выбери любое место",
        body:
            "Путешествуйте по интернету, выбирая серверы в разных странах. Быстро и без ограничений!",
        image: Center(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(
              AppConstant.borederRadius,
            ),
            child: Image.asset(
              'assets/onboard2.png',
              height: imageSize * 1.5,
              width: imageSize,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      PageViewModel(
        title: "Смотри, что хочешь",
        body:
            "Мы открываем доступ к любимым сервисам и контенту. Наслаждайтесь свободой везде!",
        image: Center(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(
              AppConstant.borederRadius,
            ),
            child: Image.asset(
              'assets/onboard3.png',
              height: imageSize * 1.5,
              width: imageSize,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      body: CustomScaffoldBg(
        child: SafeArea(
          child: IntroductionScreen(
            globalBackgroundColor: Colors.transparent,
            pages: pages,
            showSkipButton: true,
            showNextButton: true,
            showBackButton: true,

            back: BigButton(
              title: 'Back',
              borderColor: theme.colorScheme.tertiary,
            ),
            next: BigButton(
              title: 'Next',
              bgColor: theme.colorScheme.primary,
              borderColor: theme.colorScheme.primary,
              textColor: theme.cardColor,
            ),
            skip: const Text('Skip'),
            done: BigButton(
              title: 'Done',
              bgColor: theme.colorScheme.primary,
              borderColor: theme.colorScheme.primary,
              textColor: theme.cardColor,
            ),
            onDone: () {
              context.go('/auth');
            },

            onSkip: () {
              context.go('/auth');
            },

            dotsDecorator: DotsDecorator(
              color: theme.colorScheme.tertiary,
              activeColor: theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
