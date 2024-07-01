import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/utils/utils.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/merchant/core/presentation/widget/order_drawer_widget.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/shared/providers.dart';

import '../../../client/home/domain/quartier.dart';
import '../../../core/infrastructure/utils/common_import.dart';
import '../../../onboarding/presentation/widgets/page_indicators.dart';

@RoutePage()
class MerchandProductDetailScreen extends StatefulHookConsumerWidget {
  final ProductModel item;

  const MerchandProductDetailScreen({super.key, required this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchandProductDetailScreenState();
}

class _MerchandProductDetailScreenState
    extends ConsumerState<MerchandProductDetailScreen>
    with SingleTickerProviderStateMixin {
  Quartier? quartier;
  Client? client;
  final gpsLocationController = TextEditingController();
  int activeTabIndex = 0;
  PaginatedRequest params = PaginatedRequest(page: 0, size: 100);

  final _scaffold = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(findQuartierPoductsProvider.notifier).findProductQuartier();
      ref
          .refresh(merchandClientsNotifierProvider.notifier)
          .fetchMerchantClients(params);
      // ref.read(getCurrentClientProvider.notifier).getCurrentClient(ClientRequest(value: SharedPref.getEmail()));
    });
  }

  @override
  void dispose() {
    gpsLocationController.dispose();
    super.dispose();
  }

  int selected = 0;
  int number = 1;

  @override
  Widget build(BuildContext context) {
    final clients = ref.watch(merchandClientsNotifierProvider);

    ref.listen(createCommandPoductsNotifierProvider, (prev, curr) {
      curr.maybeWhen(
          orElse: () => null,
          data: (data) async {
            showSuccessFlushbar(context, "Operation réussi");
          },
          error: (errorMessage, s) {
            showErrorFlushbar(context, "$errorMessage");
          });
    });
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                key: _scaffold,
                drawer: const OrdinaryDrawerWidget(),
                appBar: CustomMarchandAppBar(
                  actionnable: true,
                  scaffoldKey: _scaffold,
                ),
                body: ListView(children: [
                  Column(
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
                                  child: SvgPicture.asset(
                                      'assets/icons/back.svg'))),
                        ],
                      ),
                      CurvedCarousel(
                        onChangeEnd: (index, isAutomatic) {
                          setState(() {
                            selected = index;
                          });
                        },
                        itemBuilder: (context, i) {
                          return Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            margin: const EdgeInsets.only(top: 20),
                            height: context.proportionnalHeight(100),
                            width: double.infinity,
                            child: AnimatedSize(
                              duration: const Duration(milliseconds: 100),
                              child: Hero(
                                tag: widget.item.id!,
                                child: CachedNetworkImage(
                                  imageUrl: widget.item.url ??
                                      "http://via.placeholder.com/350x150",
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 1,
                        reverseAutomaticMovement: true,
                        curveScale: -70,
                        viewPortSize: 1,
                        middleItemScaleRatio: 1.5,
                      ),
                      gapH32,
                      PageIndicators(
                        index: 1,
                        currentIndex: selected,
                        count: 1,
                        isMin: true,
                      ),
                      gapH6,
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 48),
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Positioned(
                              top: 16,
                              child: SvgPicture.string(
                                rawSvg,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              child: SizedBox(
                                height: 33 + 20 + 60,
                                child: Stack(
                                  alignment: AlignmentDirectional.topCenter,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 33,
                                      width: 33,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primaryColor),
                                      child: Text(
                                        number.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12),
                                      ),
                                    ),
                                    Positioned(
                                      top: 31,
                                      child: SizedBox(
                                        height: 13,
                                        child: SvgPicture.string(
                                          linkCiccle,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        children: [
                                          const Spacer(),
                                          SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: FittedBox(
                                                  child: (FloatingActionButton(
                                                backgroundColor: number == 1
                                                    ? AppColors.greyBackground
                                                    : AppColors.greyLight,
                                                elevation: 0,
                                                onPressed: number == 1
                                                    ? null
                                                    : () {
                                                        setState(() {
                                                          number--;
                                                        });
                                                      },
                                                child: const Icon(Icons.remove),
                                              )))),
                                          gapW10,
                                          Container(
                                            alignment: Alignment.center,
                                            height: 70,
                                            width: 70,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.primaryColor),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${number * widget.item.prix!}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16),
                                                ),
                                                Text(
                                                  "XAF",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          gapW10,
                                          SizedBox(
                                              width: 30,
                                              height: 30,
                                              child: FittedBox(
                                                  child: FloatingActionButton(
                                                heroTag: "#2",
                                                backgroundColor: number == 10
                                                    ? AppColors.greyBackground
                                                    : AppColors.greyLight,
                                                elevation: 0,
                                                onPressed: number >= 10
                                                    ? null
                                                    : () {
                                                        setState(() {
                                                          number++;
                                                        });
                                                      },
                                                child: const Icon(
                                                  Icons.add,
                                                ),
                                              ))),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 36.0,
                      ),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.primaryColor, width: 1))),
                      child: const Text('Details',
                          style: TextStyle(color: AppColors.primaryColor))),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36.0, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapH4,
                        Text(
                          'Client',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        gapH4,
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdown<Client>.searchRequest(
                                futureRequest: ref
                                    .watch(merchandClientsRepositoryProvider)
                                    .getSearchPatternClients,
                                decoration: CustomDropdownDecoration(
                                    closedShadow: [
                                      const BoxShadow(
                                          color: Colors.white, spreadRadius: 3),
                                    ],
                                    closedBorder: Border.all(
                                        color: AppColors.primaryColor),
                                    closedFillColor: AppColors.bgBlue),
                                hintText: 'Select Client',
                                headerBuilder: (context, val) => Text(
                                    "${val.nom ?? ""} ${val.prenom ?? ""}"),
                                listItemBuilder: (context, q, val, func) =>
                                    Text("${q.nom ?? ""} ${q.prenom ?? ""}"),
                                onChanged: (value) {
                                  client = value;
                                  setState(() {});
                                },
                                items: clients.value?.data
                                    .map((e) => e as Client)
                                    .toList(),
                              ),
                            ),
                            if (clients.isLoading ||
                                clients.isRefreshing ||
                                clients.isReloading)
                              const Center(
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2)))
                          ],
                        ),
                        gapH4,
                        detailWidget(_),
                      ],
                    ),
                  )
                ]),
              );
            })));
  }

  Widget detailWidget(BuildContext context) {
    final allQuartier = ref.watch(findQuartierPoductsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        detailItem(
          title: "Name",
          value: widget.item.designation ?? "",
        ),
        detailItem(
          title: "Seller",
          value: widget.item.marchand?.designation ?? "",
        ),
        Text(
          'Adress',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        gapH4,
        Row(
          children: [
            Expanded(
              child: CustomDropdown<Quartier>.searchRequest(
                futureRequest: ref
                    .watch(productsRepositoryProvider)
                    .findFilterAllQuartierByPatter,
                decoration: CustomDropdownDecoration(
                    closedShadow: [
                      const BoxShadow(color: Colors.white, spreadRadius: 3),
                    ],
                    closedBorder: Border.all(color: AppColors.primaryColor),
                    closedFillColor: AppColors.bgBlue),
                hintText: context.locale.foodDetailsScreenSelectQuartier,
                headerBuilder: (context, val) => Text("${val.designation}"),
                items:
                    allQuartier.value?.data.map((e) => e as Quartier).toList(),
                listItemBuilder: (context, q, val, func) =>
                    Text('${q.designation}'),
                onChanged: (value) {
                  quartier = value;
                  setState(() {});
                },
              ),
            ),
            if (allQuartier.isLoading ||
                allQuartier.isRefreshing ||
                allQuartier.isReloading)
              const Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2)))
          ],
        ),
        gapH4,
        Text(
          'Location',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        gapH4,
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: gpsLocationController,
          decoration: const InputDecoration(
            hintText: 'Exact delivery position',
          ),
          textInputAction: TextInputAction.done,
        ),

        gapH20,

        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10)),
            onPressed: () async {
              if (ref.watch(cartProvider).articles.indexWhere(
                      (element) => element.article?.id == widget.item.id) !=
                  -1) {
                return await showErrorFlushbar(context, "Already Contains");
              }

              final progress = ProgressHUD.of(context);
              progress?.show();

              ref
                  .read(createCommandPoductsNotifierProvider.notifier)
                  .createCommand(CreateCommandRequest(
                      localisationGps: gpsLocationController.text.trim(),
                      designation: widget.item.designation,
                      quartier: quartier,
                      articles: [
                        OrderArticle(article: widget.item, quantite: number)
                      ],
                      modePayement: "livraison",
                      client: client))
                  .whenComplete(() {
                progress?.dismiss();
              });
            },
            child: const Text('Add to cart')),
        // gapH12,
        // OutlinedButton(
        //     style: OutlinedButton.styleFrom(
        //         foregroundColor: AppColors.primaryColor,
        //         side: const BorderSide(color: AppColors.primaryColor),
        //         padding: const EdgeInsets.symmetric(vertical: 10)),
        //     onPressed: () {},
        //     child: const Text('About manufacture')),
        gapH30,
      ],
    );
  }

  Column detailItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        gapH4,
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        gapH12,
      ],
    );
  }
}
