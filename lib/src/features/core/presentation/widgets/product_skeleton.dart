import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:skeletons/skeletons.dart';

import '../../infrastructure/utils/common_import.dart';

Widget skeletonProduct(
  BuildContext context,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 1,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                alignment: Alignment.center,
                height: 30,
                borderRadius: BorderRadius.circular(8),
                maxLength: MediaQuery.of(context).size.width / 3,
              ))),
      SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 1,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                alignment: Alignment.center,
                height: 10,
                borderRadius: BorderRadius.circular(8),
                maxLength: MediaQuery.of(context).size.width / 3,
              ))),
      SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 1,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                alignment: Alignment.bottomLeft,
                height: 10,
                width: MediaQuery.of(context).size.width / 4.2,
                borderRadius: BorderRadius.circular(8),
                maxLength: MediaQuery.of(context).size.width / 6,
              ))),
    ],
  );
}

Widget skeletonpromotionProduct(
  BuildContext context,
) {
  return SkeletonParagraph(
      style: SkeletonParagraphStyle(
          lines: 1,
          spacing: 6,
          lineStyle: SkeletonLineStyle(
            height: context.proportionnalHeight(135),
            borderRadius: BorderRadius.circular(8),
            maxLength: MediaQuery.of(context).size.width / 3,
          )));
}
