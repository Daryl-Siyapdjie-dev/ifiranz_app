import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/delivery/orders/shared/providers.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../../../core/domain/enum.dart';
import '../../../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class MerchandOrderDetailsScreen extends StatefulHookConsumerWidget {
  final Records data;
  const MerchandOrderDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MerchandOrderDetailsScreenState();
}

class MerchandOrderDetailsScreenState extends ConsumerState<MerchandOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      deliveryOrdersNotifierProvider,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          data: (res) {
            if (res.actionError is String) {
              showErrorFlushbar(context, res.actionError!);
            }
          },
        );
      },
    );

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: CustomMarchandAppBar(title: context.locale.orderDetails),
                body: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17.0),
                        child: Text(
                          "${context.locale.order} #${widget.data.code}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(color: AppColors.bgGreyD, borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 6, child: Text(context.locale.item)),
                                const Spacer(),
                                Text(context.locale.qty),
                                const Spacer(),
                                Text(context.locale.total),
                              ],
                            ),
                            gapH4,
                            ...(widget.data.commande?.articles ?? []).map((aricle) => Column(
                                  children: [
                                    cartItem(aricle),
                                    gapH8,
                                  ],
                                )),
                            gapH16,
                            const Divider(
                              thickness: 2,
                              color: AppColors.whiteColor,
                            ),
                            gapH4,
                            cartListTile(amount: widget.data.commande?.montantLivraison?.ceil() ?? 0, title: "Shipping fee"),
                            gapH20,
                            const Divider(
                              thickness: 2,
                              color: AppColors.whiteColor,
                            ),
                            gapH12,
                            cartListTile(amount: widget.data.commande?.montant ?? 0, title: "Total", isTotal: true),
                            gapH25,
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  context.locale.ditance,
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
                                ),
                                const Spacer(),
                                Text('${widget.data.commande?.localisationGps} ${context.locale.to} ${widget.data.commande?.client?.adresse}',
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold))
                              ],
                            ),
                            gapH8,
                            Row(
                              children: [
                                Text(
                                  context.locale.address,
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
                                ),
                                const Spacer(),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('  ${widget.data.commande?.client?.adresse} ',
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                            gapH8,
                            Row(
                              children: [
                                Text(
                                  context.locale.paymentMethod,
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
                                ),
                                const Spacer(),
                                Text('   ${widget.data.commande?.modePayement}',
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        context.pushRoute(ClientDeliveryRoute(data: widget.data, isMerchant: true));
                      },
                      child: Text(context.locale.deliveryProcess)),
                ),
              );
            })));
  }

  Row cartListTile({required String title, required num amount, bool isTotal = false, bool isCoupon = false}) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.greyTextColor),
        ),
        const Spacer(),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: isCoupon ? "(-) $amount" : "$amount ",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: !isTotal ? AppColors.greyTextColor : AppColors.secondaryColor, fontWeight: FontWeight.bold, fontSize: isTotal ? 20 : 12)),
          isCoupon
              ? TextSpan(text: "%", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, color: AppColors.greyTextColor))
              : TextSpan(
                  text: "XAF",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: !isTotal ? AppColors.greyTextColor : AppColors.secondaryColor)),
        ]))
      ],
    );
  }

  Container buildStatusContainer(OrderStatus status) {
    final color = AppColors.getColorForOrderStatus(status);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: AppColors.primaryShadow,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(status.name.capitalize().toString(), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.whiteColor)),
    );
  }

  Widget cartItem(Article article) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(
        flex: 6,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.whiteColor),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: article.article?.url ?? "http://via.placeholder.com/350x150",
                    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )),
            ),
            gapW16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${article.article?.type?.designation}', style: Theme.of(context).textTheme.bodySmall),
                  gapH2,
                  Text(
                    "${article.article?.designation}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Expanded(child: Text("x${article.quantite?.toInt()}")),
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "${article.montant?.ceil()} ",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.secondaryColor, fontWeight: FontWeight.bold, fontSize: 12)),
        TextSpan(text: "XAF", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 8, color: AppColors.secondaryColor)),
      ])),
    ]);
  }
}
