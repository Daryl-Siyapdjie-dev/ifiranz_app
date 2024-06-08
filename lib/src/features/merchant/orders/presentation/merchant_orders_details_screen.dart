import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/current_cart_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/merchant/core/presentation/widget/order_drawer_widget.dart';

@RoutePage()
class MerchandOrderDetailScreen extends StatefulHookConsumerWidget {
  final CurrentCartResponse data;
  const MerchandOrderDetailScreen({required this.data, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchandOrderDetailScreenState();
}

class _MerchandOrderDetailScreenState
    extends ConsumerState<MerchandOrderDetailScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final cart = widget.data;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const OrdinaryDrawerWidget(),
      appBar: CustomMarchandAppBar(
        scaffoldKey: _scaffoldKey,
        title: "Order details",
        actionnable: true,
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Text(
                "Order #${cart.code}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                  color: AppColors.bgGreyD,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Expanded(flex: 6, child: Text("Item")),
                      Text("Qty"),
                      gapW30,
                      Text("Total"),
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
                      amount: cart.montantLivraison ?? 0,
                      title: "Shipping fee"),
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
                      amount: cart.montantTotal ?? 0,
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
                        "Adress",
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
                        "Localisation",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      const Spacer(),
                      Text(cart.client?.localisationGps ?? '',
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
                        "Customer",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      const Spacer(),
                      Text(
                          '  ${"${cart.client?.nom ?? ""} ${cart.client?.prenom ?? ""}"}',
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
                        "Payement method",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      const Spacer(),
                      Text('  ${widget.data.modePayement ?? ""}',
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
    );
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
