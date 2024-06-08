import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/domain/enum.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class ClientDeliveryOrderDetailScreen extends StatefulHookConsumerWidget {
  final Records data;
  final bool isPendingDeliveries;
  const ClientDeliveryOrderDetailScreen(
      {super.key, required this.data, this.isPendingDeliveries = false});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClientDeliveryOrderDetailScreenState();
}

class _ClientDeliveryOrderDetailScreenState
    extends ConsumerState<ClientDeliveryOrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: CustomAppBar(title: context.locale.orderDetails),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            color: AppColors.bgGreyD,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 6, child: Text(context.locale.item)),
                                const Spacer(),
                                Text(context.locale.qty),
                                const Spacer(),
                                Text(context.locale.total),
                              ],
                            ),
                            gapH4,
                            ...(widget.data.commande?.articles ?? [])
                                .map((article) => Column(
                                      children: [
                                        cartItem(article),
                                        gapH8,
                                        if (widget.data.statut ==
                                            OrderStatus.livre.value) ...[
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Spacer(
                                                flex: 3,
                                              ),
                                              Expanded(
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                    vertical: 4,
                                                  )),
                                                  onPressed: () => {
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return ProgressHUD(
                                                              barrierEnabled:
                                                                  true,
                                                              borderWidth: 0,
                                                              child: Builder(
                                                                  builder:
                                                                      (ctx) {
                                                                return Dialog(
                                                                    child: SingleChildScrollView(
                                                                        child: NotationWidget(
                                                                            id: article
                                                                                .article!.id!,
                                                                            ctx:
                                                                                ctx)));
                                                              }));
                                                        })
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Icon(Icons.star,
                                                          size: 13,
                                                          color: AppColors
                                                              .whiteColor),
                                                      gapW4,
                                                      Text(
                                                        context.locale.rate,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: AppColors
                                                                .whiteColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ]
                                      ],
                                    )),
                            gapH16,
                            const Divider(
                              thickness: 2,
                              color: AppColors.whiteColor,
                            ),
                            gapH4,
                            cartListTile(
                                amount: widget.data.commande?.montantLivraison
                                        ?.ceil() ??
                                    0,
                                title:
                                    context.locale.clientCartScreenShippingFee),
                            gapH20,
                            const Divider(
                              thickness: 2,
                              color: AppColors.whiteColor,
                            ),
                            gapH12,
                            cartListTile(
                                amount: widget.data.commande?.montant ?? 0,
                                title: context.locale.total,
                                isTotal: true),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.greyTextColor),
                                ),
                                const Spacer(),
                                Text(
                                    '${widget.data.commande?.localisationGps} ${context.locale.to} ${widget.data.commande?.client?.adresse}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontWeight: FontWeight.bold))
                              ],
                            ),
                            gapH8,
                            Row(
                              children: [
                                Text(
                                  context.locale.address,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.greyTextColor),
                                ),
                                const Spacer(),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        '  ${widget.data.commande?.client?.adresse} ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                            gapH8,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  context.locale.client,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.greyTextColor),
                                ),
                                const Spacer(),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        '  ${widget.data.commande?.client?.nom} ${widget.data.commande?.client?.prenom}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                            gapH8,
                          ],
                        ),
                      ),
                    ]),
                bottomNavigationBar: (!widget.isPendingDeliveries ||
                        widget.data.commande?.statut == OrderStatus.livre.value)
                    ? null
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                            onPressed: () {
                              context.pushRoute(ClientDeliveryRoute(
                                data: widget.data,
                              ));
                            },
                            child: Text(context.locale.deliveryProcess)),
                      ),
              );
            })));
  }

  Row cartListTile(
      {required String title,
      required num amount,
      bool isTotal = false,
      bool isCoupon = false}) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.greyTextColor),
        ),
        const Spacer(),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: isCoupon ? "(-) $amount" : "$amount ",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: !isTotal
                      ? AppColors.greyTextColor
                      : AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: isTotal ? 20 : 12)),
          isCoupon
              ? TextSpan(
                  text: "%",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: AppColors.greyTextColor))
              : TextSpan(
                  text: "XAF",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: !isTotal
                          ? AppColors.greyTextColor
                          : AppColors.secondaryColor)),
        ]))
      ],
    );
  }

  Widget cartItem(Article item) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(
        flex: 6,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.whiteColor),
              child: CachedNetworkImage(
                imageUrl:
                    item.article!.url ?? "http://via.placeholder.com/350x150",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            gapW16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item.article?.marchand?.designation}',
                      style: Theme.of(context).textTheme.bodySmall),
                  gapH2,
                  Text(
                    "${item.article?.designation}",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Expanded(child: Text("x${item.quantite!.toInt()}")),
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "${item.article?.prix} ",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12)),
        TextSpan(
            text: "XAF",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 8, color: AppColors.secondaryColor)),
      ])),
    ]);
  }

  num getTotalCart(List<OrderArticle> cart) {
    num price = 0;

    final allPrices = [];
    for (OrderArticle o in cart) {
      allPrices.add(o.article!.prix! * o.quantite!);
    }

    price = allPrices.reduce((value, element) => value + element);

    return price;
  }
}

class NotationWidget extends StatefulHookConsumerWidget {
  final BuildContext ctx;
  final int id;
  const NotationWidget({
    super.key,
    required this.ctx,
    required this.id,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotationWidgetState();
}

class _NotationWidgetState extends ConsumerState<NotationWidget> {
  int startSelected = 0;

  @override
  Widget build(BuildContext context) {
    final comment = useTextEditingController();
    ref.listen(makeNotationPoductsNotifierProvider, (prev, next) {
      next.maybeWhen(
          orElse: () => null,
          data: (_) async {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            showSuccessFlushbar(context, context.locale.operationSuccess);
          },
          error: (e, s) {
            showErrorFlushbar(context, e.toString());
          });
    });

    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        gapH10,
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            context.locale.foodDetailsScreenRateThisFood,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        gapH10,
        Wrap(
          children: List.generate(
              5,
              (index) => InkWell(
                    onTap: () {
                      setState(() {
                        startSelected = index + 1;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index < startSelected
                                  ? AppColors.primaryColor
                                  : AppColors.greyBackground),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 9),
                          margin: const EdgeInsets.only(left: 4, bottom: 4),
                          child: Row(children: [
                            Text(
                              (index + 1).toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: index < startSelected
                                          ? AppColors.whiteColor
                                          : AppColors.greyLight),
                            ),
                            gapW8,
                            Icon(
                              Icons.star,
                              size: 12,
                              color: index < startSelected
                                  ? AppColors.whiteColor
                                  : AppColors.greyLight,
                            )
                          ]),
                        ),
                      ],
                    ),
                  )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            context.locale.giveYourFeedBack,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        gapH20,
        TextFormField(
          controller: comment,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: context.locale.leaveUsAComment,
          ),
          textInputAction: TextInputAction.done,
          minLines: 3,
          maxLines: 6,
          obscureText: false,
        ),
        gapH20,
        ValueListenableBuilder(
            valueListenable: comment,
            builder: (context, val, child) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10)),
                  onPressed: startSelected == 0 && val.text.isNotEmpty
                      ? null
                      : () {
                          final progress = ProgressHUD.of(widget.ctx);
                          progress?.show();
                          ref
                              .read(
                                  makeNotationPoductsNotifierProvider.notifier)
                              .makeNotation(
                                  widget.id, startSelected, val.text.trim())
                              .whenComplete(() {
                            progress!.dismiss();
                          });
                        },
                  child: Text(context.locale.submit));
            }),
        gapH20,
      ]),
    );
  }
}
