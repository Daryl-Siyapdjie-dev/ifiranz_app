import 'package:flutter/material.dart';

import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/presentation/themes/app_colors.dart';

class PageIndicators extends StatelessWidget {
  final int index;
  final int currentIndex;
  final int count;
  final bool isMin;
  const PageIndicators({
    super.key,
    required this.index,
    required this.currentIndex,
    this.count = 3,
    this.isMin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          height: isMin ? 4 : 8,
          margin: const EdgeInsets.only(right: AppSizes.p8),
          width: isMin
              ? currentIndex == index
                  ? 20
                  : 10
              : currentIndex == index
                  ? 35
                  : 20,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.primaryColor
                : AppColors.greyLight,
            borderRadius: BorderRadius.circular(AppSizes.p30),
          ),
        ),
      ),
    );
  }
}
