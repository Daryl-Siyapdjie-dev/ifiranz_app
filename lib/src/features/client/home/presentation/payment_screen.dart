import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/order_detail_screen.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/cashout_model.dart';
import 'package:ifiranz_client/src/features/client/payment/share/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/domain/paginated_request.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../core/presentation/widgets/no_data.dart';
import '../../../core/presentation/widgets/product_skeleton.dart';
import '../domain/filter_optional.dart';
import '../shared/providers.dart';

@RoutePage()
class PaymentScreen extends StatefulHookConsumerWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  int _paymentSelected = -1;
  CashoutModel? paymentSelectedInfo;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _onTabsRouterChange();
    });
    super.initState();
  }

  final List<FilterOptional> request = [
    FilterOptional(
      key: 'inPromotion',
      value: true,
      type: "EQUAL",
    )
  ];
  Future _onTabsRouterChange() async {
    final localPage = PaginatedRequest(page: 0, size: 10);
    await ref
        .read(paymentMerchantsNotifier.notifier)
        .fetchPaymentMerchants(localPage, request);
  }

  @override
  Widget build(BuildContext context) {
    final paymentMerchants = ref.watch(paymentMerchantsNotifier);
    // final operateurOrange = ref.watch(getOperatorProvider(30056));
    // final operateurEsppressUnion = ref.watch(getOperatorProvider(90010));
    // final operateurYommee = ref.watch(getOperatorProvider(100238));
    // final operateurMTN = ref.watch(getOperatorProvider(20056));

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ProgressHUD(
          barrierEnabled: true,
          borderWidth: 0,
          child: Builder(builder: (_) {
            return Scaffold(
              appBar: CustomAppBar(title: context.locale.payment),
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      context.locale.paymentMethod,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Transform.rotate(
                            angle: -33,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.blackColor,
                              size: 14,
                            ))),
                  ),
                  gapH4,
                  paymentMerchants.when(
                    data: (response) {
                      return response.data.isEmpty
                          ? NoData(
                              text: context.locale.clientHomeTabNoDataFound,
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: response.data.length,
                              itemBuilder: ((context, index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _paymentSelected = index;
                                        paymentSelectedInfo =
                                            response.data[index];
                                      });
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.only(bottom: 10.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 11),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.greyBackground),
                                      child: Row(children: [
                                        SizedBox(
                                          height: 30,
                                          child: Radio(
                                              value: index,
                                              groupValue: _paymentSelected,
                                              onChanged: (onChanged) {
                                                setState(() {
                                                  _paymentSelected = index;
                                                  paymentSelectedInfo =
                                                      response.data[index];
                                                });
                                              }),
                                        ),
                                        Image.asset(
                                          "assets/images/orange-money.png",
                                          height: 30,
                                          width: 30,
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Text(
                                              response.data[index].name ?? "",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            gapH2,
                                            paymentMerchants.when(
                                                data: (response) =>
                                                    const SizedBox(),
                                                error: (e, s) => IconButton(
                                                    onPressed: () {},
                                                    // onPressed: () => ref.refresh(
                                                    //     getOperatorProvider(50053).future),
                                                    icon: const Icon(
                                                        Icons.refresh)),
                                                loading: () => const SizedBox(
                                                    height: 5,
                                                    width: 100,
                                                    child:
                                                        LinearProgressIndicator())),
                                          ],
                                        )
                                      ]),
                                    ),
                                  )));
                    },
                    error: (error, _) => Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          SelectableText(error.toString()),
                          TextButton.icon(
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor),
                              onPressed: () {
                                _onTabsRouterChange();
                              },
                              icon: const Icon(Icons.refresh,
                                  color: AppColors.whiteColor),
                              label: const Text(
                                'Refresh',
                                style: TextStyle(color: AppColors.whiteColor),
                              )),
                        ],
                      ),
                    )),
                    loading: () => MasonryGridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      crossAxisCount: 1,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return skeletonProduct(context);
                      },
                    ),
                  ),
                  // if (false)
                  // InkWell(
                  //   onTap: () {
                  //     if (_paymentSelected == 90010) {
                  //       _paymentSelected = -1;
                  //     } else {
                  //       _paymentSelected = 90010;
                  //     }
                  //     setState(() {});
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.greyBackground),
                  //     child: Row(children: [
                  //       SizedBox(
                  //         height: 30,
                  //         child: Radio(
                  //             value: 90010,
                  //             groupValue: _paymentSelected,
                  //             onChanged: (onChanged) {
                  //               if (_paymentSelected == 90010) {
                  //                 _paymentSelected = -1;
                  //               } else {
                  //                 _paymentSelected = 90010;
                  //               }
                  //               setState(() {});
                  //             }),
                  //       ),
                  //       Image.asset(
                  //         "assets/images/express-union-momo.png",
                  //         height: 30,
                  //         width: 30,
                  //       ),
                  //       const Spacer(),
                  //       Column(
                  //         children: [
                  //           const Text(
                  //             'Eu money',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //           gapH2,
                  //           operateurEsppressUnion.when(
                  //               data: (e) => const SizedBox(),
                  //               error: (e, s) =>
                  //                   IconButton(onPressed: () => ref.refresh(getOperatorProvider(90010).future), icon: const Icon(Icons.refresh)),
                  //               loading: () => const SizedBox(height: 5, width: 100, child: LinearProgressIndicator())),
                  //         ],
                  //       )
                  //     ]),
                  //   ),
                  // ),
                  gapH4,
                  // InkWell(
                  //   onTap: () {
                  //     if (_paymentSelected == 100238) {
                  //       _paymentSelected = -1;
                  //     } else {
                  //       _paymentSelected = 100238;
                  //     }
                  //     setState(() {});
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.greyBackground),
                  //     child: Row(children: [
                  //       SizedBox(
                  //         height: 30,
                  //         child: Radio(
                  //             value: 100238,
                  //             groupValue: _paymentSelected,
                  //             onChanged: (onChanged) {
                  //               if (_paymentSelected == 100238) {
                  //                 _paymentSelected = -1;
                  //               } else {
                  //                 _paymentSelected = 100238;
                  //               }
                  //               setState(() {});
                  //             }),
                  //       ),
                  //       Image.asset(
                  //         "assets/images/yoome.png",
                  //         height: 30,
                  //         width: 30,
                  //       ),
                  //       const Spacer(),
                  //       Column(
                  //         children: [
                  //           const Text(
                  //             'Yoomee money',
                  //             style: TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //           gapH2,
                  //           operateurYommee.when(
                  //               data: (e) => const SizedBox(),
                  //               error: (e, s) =>
                  //                   IconButton(onPressed: () => ref.refresh(getOperatorProvider(100238).future), icon: const Icon(Icons.refresh)),
                  //               loading: () => const SizedBox(height: 5, width: 100, child: LinearProgressIndicator())),
                  //         ],
                  //       )
                  //     ]),
                  //   ),
                  // ),
                  gapH32,
                ],
              ),
              bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10)),
                    onPressed: _paymentSelected == -1
                        ? null
                        : () {
                            if (paymentSelectedInfo == null) return;
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return OrderDetailsScreen(
                                  paymentIOPtionInfo:
                                      paymentSelectedInfo ?? CashoutModel());
                            }));
                            // context.pushRoute(OrderDetailsRoute(
                            //     paymentIOPtionInfo:
                            //         paymentSelectedInfo ?? CashoutModel()));
                          },
                    child: Text(context.locale.next)),
              ),
            );
          })),
    );
  }
}
