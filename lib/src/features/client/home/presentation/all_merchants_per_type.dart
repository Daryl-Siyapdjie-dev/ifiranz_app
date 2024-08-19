import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../router/app_router.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/extensions/localization_extension.dart';
import '../../../core/infrastructure/extensions/media_query_extension.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../core/presentation/widgets/app_bars.dart';
import '../../../core/presentation/widgets/merchant_item.dart';
import '../domain/infrastructur_model.dart';
import '../domain/product_model.dart';

@RoutePage()
class MerchantPerTypeScreen extends StatefulHookConsumerWidget {
  final List<InfrastructurModel> merchants;
  const MerchantPerTypeScreen({super.key, required this.merchants});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchantPerTypeScreenState();
}

class _MerchantPerTypeScreenState extends ConsumerState<MerchantPerTypeScreen> {
  @override
  Widget build(BuildContext context) {
    final activeIndex = useState(0);

    final pageContoller = usePageController(viewportFraction: .87);
    final controller = useScrollController();

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(isHome: false),
      body: ListView(
        controller: controller,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 24),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.greyBackground),
                child: InkWell(
                  onTap: context.popRoute,
                  child: SvgPicture.asset('assets/icons/back.svg'),
                ),
              ),
            ],
          ),
          if (widget.merchants.isNotEmpty) gapH25,
          if (widget.merchants.isNotEmpty)
            Center(
              child: Text(widget.merchants.first.type,
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
          gapH25,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.merchants.length,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemBuilder: (context, index) {
                return MerchantItem(merchant: widget.merchants[index]);
              },
            ),
          ),
          gapH64
        ],
      ),
    );
  }

  Widget mainItem(BuildContext context, bool isMin, ProductModel data) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(FoodDetailsRoute(item: data));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(isMin ? 8 : 16),
        height: isMin ? context.proportionnalHeight(135) : null,
        width: context.screenWidth / 1.15,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                      style: const TextStyle(color: AppColors.whiteColor),
                      TextSpan(children: [
                        TextSpan(text: data.promotionMessage),
                      ])),
                  gapH8,
                  Text(
                    '${data.priceReductionPercentage!} %',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: isMin ? 12 : 24,
                        decoration: TextDecoration.none, //
                        color: AppColors.primaryColor,
                        shadows: const [
                          Shadow(
                              offset: Offset(-1.5, -1.5), color: Colors.white),
                          Shadow(
                              offset: Offset(1.5, -1.5), color: Colors.white),
                          Shadow(offset: Offset(1.5, 1.5), color: Colors.white),
                          Shadow(
                              offset: Offset(-1.5, 1.5), color: Colors.white),
                        ]),
                  ),
                  gapH6,
                  Container(
                    alignment: Alignment.topLeft,
                    constraints:
                        const BoxConstraints.tightForFinite(width: 150),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 16),
                            minimumSize: const Size.fromHeight(24),
                            backgroundColor: AppColors.whiteColor),
                        onPressed: () {
                          context.pushRoute(FoodDetailsRoute(item: data));
                        },
                        child: Text(
                            context.locale.clientHomeTabMainItemOrderNow,
                            style:
                                const TextStyle(color: AppColors.blackColor))),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: data.url!,
                width: context.proportionnalHeight(150),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
