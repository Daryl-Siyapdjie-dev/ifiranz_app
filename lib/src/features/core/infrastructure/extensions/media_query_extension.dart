import '../constants/app_sizes.dart';
import '../utils/common_import.dart';

extension MediaSize on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double proportionnalHeight(double val) =>
      (val * screenHeight) / AppSizes.pDesignHeight;
}
