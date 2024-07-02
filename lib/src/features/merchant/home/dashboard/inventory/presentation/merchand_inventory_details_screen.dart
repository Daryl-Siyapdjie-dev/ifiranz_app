import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/delivery/orders/shared/providers.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/domain/inventory.dart';

import '../../../../../core/infrastructure/utils/common_import.dart';
import '../../../../../delivery/orders/domain/delivery_models.dart';

@RoutePage()
class MerchandInventoryDetailsScreen extends StatefulHookConsumerWidget {
  final Inventory data;
  const MerchandInventoryDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MerchandInventoryDetailsScreenState();
}

class MerchandInventoryDetailsScreenState extends ConsumerState<MerchandInventoryDetailsScreen> {
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
        child: Scaffold(
          appBar: const CustomMarchandAppBar(title: "Inventory details"),
          body: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17.0),
                  child: Text(
                    "Inventory #${widget.data.code}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(color: AppColors.bgGreyD, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(flex: 6, child: Text("Item")),
                          Spacer(),
                          Text("Qty"),
                          Spacer(),
                          Text("Total"),
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
                          Text('${widget.data.commande?.localisationGps} to ${widget.data.commande?.client?.adresse}',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customer",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.greyTextColor),
                          ),
                          const Spacer(),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('  ${widget.data.commande?.client?.nom} ${widget.data.commande?.client?.prenom}',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      gapH8,
                      Row(
                        children: [
                          Text(
                            "Payement method",
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
        ));
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

  Widget cartItem(Article article) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(
        flex: 6,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
