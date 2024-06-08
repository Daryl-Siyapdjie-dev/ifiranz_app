import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../core/infrastructure/constants/app_sizes.dart';
import '../../core/infrastructure/extensions/localization_extension.dart';
import '../../core/infrastructure/extensions/theme_extension.dart';
import '../../core/infrastructure/utils/common_import.dart';
import '../../core/presentation/themes/app_colors.dart';
import 'widgets/page_indicators.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  int _currentIndex = 0;

  void moveNext() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.p25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/img0.png',
                      width: 250,
                    ),
                    gapH32,
                    PageIndicators(
                      index: _currentIndex,
                      currentIndex: _currentIndex,
                    ),
                    gapH32,
                    Text(
                      context.locale.onboardingScreenTitleOneLabel,
                      style: GoogleFonts.quicksand(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: AppColors.blackColor,
                      ),
                    ),
                    gapH12,
                    Text(
                      context.locale.onboardingScreenDescriptionOneLabel,
                      textAlign: TextAlign.center,
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.greyTextColor,
                        fontSize: 16,
                      ),
                    ),
                    gapH25,
                    ElevatedButton(
                      onPressed: moveNext,
                      child: Text(
                          context.locale.onboardingScreenContinueButtonLabel),
                    ),
                    gapH16,
                    OutlinedButton(
                      onPressed: () => context.pushRoute(const SignInRoute()),
                      child: Text(context.locale
                          .onboardingScreenAlreadyHaveAnAccountButtonLabel),
                    )
                  ],
                ),
              ).animate().scale(delay: 50.milliseconds).fadeIn(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.p25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/img1.png',
                        width: 250,
                      ),
                      gapH32,
                      PageIndicators(
                        index: _currentIndex,
                        currentIndex: _currentIndex,
                      ),
                      gapH32,
                      Text(
                        context.locale.onboardingScreenTitleTwoLabel,
                        style: context.theme.textTheme.titleLarge!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      gapH12,
                      Text(
                        context.locale.onboardingScreenDescriptionTwoLabel,
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.greyTextColor,
                          fontSize: 16,
                        ),
                      ),
                      gapH25,
                      ElevatedButton(
                        onPressed: moveNext,
                        child: Text(
                            context.locale.onboardingScreenContinueButtonLabel),
                      ),
                    ],
                  ),
                ),
              ).animate().scale(delay: 50.milliseconds).fadeIn(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.p25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/img2.png',
                        width: 250,
                      ),
                      gapH32,
                      PageIndicators(
                        index: _currentIndex,
                        currentIndex: _currentIndex,
                      ),
                      gapH32,
                      Text(
                        context.locale.onboardingScreenTitleThreeLabel,
                        style: context.theme.textTheme.titleLarge!.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      gapH12,
                      Text(
                        context.locale.onboardingScreenDescriptionThreeLabel,
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.bodyMedium!.copyWith(
                          color: AppColors.greyTextColor,
                          fontSize: 16,
                        ),
                      ),
                      gapH25,
                      ElevatedButton(
                        onPressed: () => context.pushRoute(const SignInRoute()),
                        child: Text(
                            context.locale.onboardingScreenContinueButtonLabel),
                      ),
                    ],
                  ),
                ),
              ).animate().scale(delay: 50.milliseconds).fadeIn(),
            ],
          ),
        ],
      ),
    );
  }
}
