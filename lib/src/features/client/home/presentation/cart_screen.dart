import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/quartier.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/utils.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/widgets/no_data.dart';
import 'payment_screen.dart';

@RoutePage()
class CartScreen extends StatefulHookConsumerWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  void initState() {
    ref.read(cartProvider.notifier).getCurrentCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: CustomAppBar(
                  isHome: false,
                  title: context.locale.clientCartScreenTitle,
                ),
                body: cart.articles.isEmpty
                    ? InkWell(
                        onTap: () {
                          ref.read(cartProvider.notifier).getCurrentCart();
                        },
                        child: NoData(
                            text: context.locale.clientCartScreenEmptyCart))
                    : (cart.quartier is! Quartier)
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  final progress = ProgressHUD.of(_);
                                  progress?.show();
                                  ref
                                      .read(cartProvider.notifier)
                                      .clearCart(cart)
                                      .whenComplete(() => progress?.dismiss());
                                },
                                child: Text(
                                    context.locale.clientCartScreenClearCart),
                              ),
                            ),
                          )
                        : ListView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            children: [
                              ...cart.articles.map((e) => Column(
                                    children: [
                                      cartItem(_, e),
                                      gapH12,
                                    ],
                                  )),
                              gapH20,
                              const Divider(
                                thickness: 1,
                                color: AppColors.greyTextColor,
                              ),
                              gapH25,
                              cartListTile(
                                  title:
                                      context.locale.clientCartScreenSubtotal,
                                  amount: (cart.articles.isEmpty
                                          ? 0
                                          : getTotalCart(cart.articles))
                                      .formatMoney()),
                              cartListTile(
                                  title: context
                                      .locale.clientCartScreenShippingFee,
                                  amount: (cart.montantLivraison ?? 0)
                                      .formatMoney()),
                              gapH16,
                              const Divider(
                                thickness: 1,
                                color: AppColors.greyTextColor,
                              ),
                              gapH10,
                              cartListTile(
                                  title: context.locale.clientCartScreenTotal,
                                  amount: (cart.articles.isEmpty
                                          ? 0
                                          : getTotalCart(cart.articles) +
                                              (cart.montantLivraison ?? 0))
                                      .formatMoney(),
                                  isTotal: true),
                              gapH32,
                            ],
                          ),
                bottomNavigationBar: (cart.articles.isEmpty)
                    ? null
                    : Container(
                        height: 128,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentScreen()));
                                  // context.pushRoute(const PaymentRoute());
                                },
                                child: Text(context
                                    .locale.clientCartScreenChoosePayment)),
                            gapH12,
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.primaryColor,
                                    side: const BorderSide(
                                        color: AppColors.primaryColor),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10)),
                                onPressed: () {
                                  final progress = ProgressHUD.of(_);
                                  progress?.show();
                                  ref
                                      .read(cartProvider.notifier)
                                      .clearCart(cart)
                                      .whenComplete(() => progress?.dismiss());
                                },
                                child: Text(context
                                    .locale.clientCartScreenClearCartButton)),
                          ],
                        ),
                      ),
              );
            })));
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

  Row cartListTile(
      {required String title,
      required String amount,
      bool isTotal = false,
      bool isCoupon = false}) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge!),
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
                  fontSize: isTotal ? 16 : 14)),
          isCoupon
              ? TextSpan(
                  text: "%",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 16, color: AppColors.greyTextColor))
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

  Container cartItem(BuildContext ctx, OrderArticle order) {
    final product = order.article!;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.bgGreyLike,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Container(
            height: context.screenHeight * .09,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: order.article?.url ??
                      "http://via.placeholder.com/350x150",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
        ),
        gapW16,
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.designation ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text((product.marchand?.designation ?? ""),
                  style: Theme.of(context).textTheme.bodySmall),
              gapH2,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        final progress = ProgressHUD.of(ctx);
                        progress?.show();
                        ref
                            .read(cartProvider.notifier)
                            .decrementItem(order)
                            .whenComplete(() => progress?.dismiss());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 3),
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8))),
                        child: Text("-",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColors.whiteColor)),
                      )),
                  gapW6,
                  Text(order.quantite.toString(),
                      style: Theme.of(context).textTheme.bodyLarge),
                  gapW6,
                  InkWell(
                    splashColor: AppColors.bgGreyD,
                    onTap: () {
                      final progress = ProgressHUD.of(ctx);
                      progress?.show();
                      ref
                          .read(cartProvider.notifier)
                          .incrementItem(order)
                          .whenComplete(() => progress?.dismiss());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: Text("+",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColors.whiteColor)),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: (order.quantite! * product.salePrice!)
                              .formatMoney(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                      TextSpan(
                          text: " XAF",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColors.secondaryColor)),
                    ])),
                  ),
                ],
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            final progress = ProgressHUD.of(ctx);
            progress?.show();
            ref
                .read(cartProvider.notifier)
                .removeItem(order)
                .whenComplete(() => progress?.dismiss());
          },
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.whiteColor),
            child: const Icon(
              Icons.close,
              size: 14,
            ),
          ),
        )
      ]),
    );
  }
}
