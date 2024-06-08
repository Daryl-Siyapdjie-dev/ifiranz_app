import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/utils/common_import.dart';

class OnboardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  const OnboardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.p25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 250,
            ),
            gapH32,
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 22,
                  ),
            ),
            gapH20,
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                  ),
            )
          ],
        ),
      ),
    ).animate().scale(delay: 50.milliseconds).fadeIn();
  }
}
