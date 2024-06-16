import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/current_cart_response.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/order_tab_screen.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/cashout_model.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/utils.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/utils/api_constants.dart';
import '../../../core/infrastructure/utils/extension.dart';
import '../../payment/application/payment_notifier.dart';
import '../../payment/domain/initiate_request.dart';
import '../../payment/share/providers.dart';

@RoutePage()
class OrderDetailsScreen extends StatefulHookConsumerWidget {
  final CashoutModel paymentIOPtionInfo;
  const OrderDetailsScreen({required this.paymentIOPtionInfo, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends ConsumerState<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    ref.listen<PaymentState>(
      paymentProvider,
      (previous, next) {
        next.maybeWhen(
          orElse: () {
            print("object");
          },
          failed: (errorMessage) {
            Flushbar(
              message: "$errorMessage",
              icon: const Icon(
                Icons.info,
                color: AppColors.alertError,
              ),
              borderRadius: BorderRadius.circular(10),
              backgroundColor: AppColors.bgRed,
              messageColor: AppColors.alertError,
              duration: const Duration(seconds: ApiConstants.flushbarDuration),
              margin: const EdgeInsets.all(16),
            ).show(context);
          },
          initiated: (value) {
            // await Future.delayed(const Duration(seconds: 1));
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return OrderTabScreen(
                operatorInfo: widget.paymentIOPtionInfo,
                transactionResponse: value,
              );
            }));
            //                     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //                   return OrderTabScreen(
            //   operatorInfo: widget.paymentIOPtionInfo,
            //   transactionResponse: value,
            // );)
            // context.pushRoute(OrderTabRoute(
            //   operatorInfo: widget.paymentIOPtionInfo,
            //   transactionResponse: value,
            // ));
          },
        );
      },
    );

    return ProgressHUD(
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
                    "${context.locale.order} #${cart.code}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      color: AppColors.bgGreyD,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 6, child: Text(context.locale.item)),
                          const Text("Qty"),
                          gapW30,
                          Text(context.locale.total),
                        ],
                      ),
                      gapH4,
                      ...cart.articles.map((e) => Column(
                            children: [
                              cartItem(e),
                              gapH8,
                            ],
                          )),
                      gapH16,
                      const Divider(
                        thickness: 2,
                        color: AppColors.whiteColor,
                      ),
                      gapH4,
                      cartListTile(
                          title: context.locale.clientCartScreenSubtotal,
                          amount: (cart.articles.isEmpty
                                  ? 0
                                  : getTotalCart(cart.articles))
                              .formatMoney()),
                      cartListTile(
                          amount: (cart.montantLivraison ?? 0).formatMoney(),
                          title: context.locale.clientCartScreenShippingFee),
                      gapH6,
                      // cartListTile(
                      //     amount: 20, title: "Coupon discount", isCoupon: true),
                      gapH20,
                      const Divider(
                        thickness: 2,
                        color: AppColors.whiteColor,
                      ),
                      gapH12,
                      cartListTile(
                          amount: (cart.greatMontantTotal()).formatMoney(),
                          title: "Total",
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
                            context.locale.address,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.greyTextColor),
                          ),
                          const Spacer(),
                          Text(cart.client?.adresse ?? '',
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
                            context.locale.registerAdditionnalLocation,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.greyTextColor),
                          ),
                          const Spacer(),
                          Text(cart.localisationGps ?? '',
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
                            'Date',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.greyTextColor),
                          ),
                          const Spacer(),
                          Text(
                              (cart.dateCreate is String)
                                  ? formatToHumanFriendly(
                                      DateTime.parse(cart.dateCreate!))
                                  : '',
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
                            context.locale.paymentMethod,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.greyTextColor),
                          ),
                          const Spacer(),
                          Text('  ${widget.paymentIOPtionInfo.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ],
                  ),
                ),
                gapH32,
              ]),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10)),
                onPressed: () {
                  // initiate the transaction
                  final progress = ProgressHUD.of(_);
                  progress?.show();

                  ref
                      .read(paymentProvider.notifier)
                      .initTranstion(InitiateRequest(
                          command: cart.id,
                          paymentMethod: widget.paymentIOPtionInfo.id))
                      // .then((value) => null)
                      .whenComplete(() => progress?.dismiss());
                  // context.navigateTo(
                  //     OrderTabRoute(operatorInfo: widget.paymentIOPtionInfo));

                  // context.pushRoute(OrderDetailsRoute(
                  //     paymentIOPtionInfo: operateurOrange.value!));

                  // final progress = ProgressHUD.of(_);
                  // progress?.show();
                },
                child: Text(context.locale.next)),
          ),
        );
      }),
    );
  }

  Row cartListTile(
      {required String title,
      required String amount,
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

  Widget cartItem(OrderArticle item) {
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
                      item.article?.url ?? "http://via.placeholder.com/350x150",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
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
            text: "${item.article?.salePrice?.formatMoney()} ",
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
      allPrices.add(o.article!.salePrice! * o.quantite!);
    }

    price = allPrices.reduce((value, element) => value + element);

    return price;
  }
}
