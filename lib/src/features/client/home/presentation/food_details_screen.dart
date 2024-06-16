import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client_request.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/client/home/domain/create_command_request.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/utils/utils.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../../../onboarding/presentation/widgets/page_indicators.dart';
import '../../delivery/application/location_picker_notifier/search_place_notifier.dart';
import '../domain/quartier.dart';

@RoutePage()
class FoodDetailsScreen extends StatefulHookConsumerWidget {
  final ProductModel item;

  const FoodDetailsScreen({super.key, required this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends ConsumerState<FoodDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Quartier? quartier;
  final gpsLocationController = TextEditingController();
  int activeTabIndex = 0;

  // ignore: always_declare_return_types
  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(findQuartierPoductsProvider.notifier).findProductQuartier();
      ref
          .read(getCurrentClientProvider.notifier)
          .getCurrentClient(ClientRequest(value: SharedPref.getEmail()));
      ref
          .read(getProductDetailNotifier.notifier)
          .fetchProduct(widget.item.code!);
      // ref.read(getCurrentClientProvider.notifier).getCurrentClient(ClientRequest(value: SharedPref.getEmail()));
    });

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    gpsLocationController.dispose();
    super.dispose();
  }

  int selected = 0;
  int number = 1;

  @override
  Widget build(BuildContext context) {
    ref.listen(createCommandPoductsNotifierProvider, (prev, curr) {
      curr.maybeWhen(
          orElse: () => null,
          data: (data) async {
            showSuccessFlushbar(
                context, context.locale.foodDetailsScreenOperationSuccess);
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
                appBar: const CustomAppBar(
                  isHome: false,
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
                                        "http://via.placeholder.com/150x150",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1.5,
                                        value: downloadProgress.progress,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  )),
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
                                height: 33 + 20 + 60 + 10,
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
                                            height: 80,
                                            width: 120,
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
                                                  "${number * (widget.item.salePrice ?? widget.item.prix ?? 0.0)}",
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
                  Theme(
                    data: Theme.of(context).copyWith(
                        tabBarTheme: TabBarTheme(
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: const EdgeInsets.all(
                              0,
                            ),
                            indicator: const UnderlineTabIndicator(
                              insets: EdgeInsets.only(bottom: 15),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: AppColors
                                      .primaryColor // Change this color as per your requirement
                                  ),
                            ),
                            labelStyle: Theme.of(context).textTheme.bodyLarge,
                            unselectedLabelStyle:
                                Theme.of(context).textTheme.bodyLarge,
                            unselectedLabelColor:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            labelColor: AppColors.primaryColor)),
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        const Tab(text: 'Details'),
                        Tab(text: context.locale.comments),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: [
                        detailWidget(_),
                        getComment(),
                      ].elementAt(_tabController.index)),
                ]),
              );
            })));
  }

  Widget reviewWidget() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Text(
          "Rate this food",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      Wrap(
        children: List.generate(
            5,
            (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index < 4
                              ? AppColors.primaryColor
                              : AppColors.greyBackground),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 11),
                      margin: const EdgeInsets.only(left: 8, bottom: 8),
                      child: Row(children: [
                        Text(
                          (index + 1).toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: index < 4
                                      ? AppColors.whiteColor
                                      : AppColors.greyLight),
                        ),
                        gapW8,
                        Icon(
                          Icons.star,
                          size: 14,
                          color: index < 4
                              ? AppColors.whiteColor
                              : AppColors.greyLight,
                        )
                      ]),
                    ),
                  ],
                )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Text(
          "Give your feedback",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          hintText: 'Leave us a comment',
        ),
        textInputAction: TextInputAction.done,
        minLines: 3,
        maxLines: 6,
        obscureText: false,
      ),
      gapH20,
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10)),
          onPressed: () {},
          child: const Text('Submit')),
      gapH20,
    ]);
  }

  Widget getComment() {
    final product = ref.watch(getProductDetailNotifier);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Column(
        children: [
          switch (product) {
            AsyncData() => product.value.notes!.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(context.locale.emptyComment),
                    ),
                  )
                : Column(children: [
                    ...product.value.notes!
                        .map((e) => ListTile(
                            trailing:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                e.note.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                              const Icon(
                                Icons.star,
                                size: 10,
                                color: AppColors.primaryColor,
                              )
                            ]),
                            subtitle: Text(
                              (e.commentaire ?? "").capitalize(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            title: Text(
                                "${e.client?.nom?.capitalize() ?? ""} ${e.client?.prenom?.capitalize() ?? ""}")))
                        .toList(),
                  ]),
            AsyncError() => Padding(
                padding: const EdgeInsets.all(50.0),
                child: IconButton(
                  onPressed: () {
                    ref
                        .read(getProductDetailNotifier.notifier)
                        .fetchProduct(widget.item.code!);
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ),
            AsyncLoading() => const Center(
                child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            _ => Container()
          }
        ],
      ),
    );
  }

  Widget detailWidget(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final allQuartier = ref.watch(findQuartierPoductsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH10,
        detailItem(
          title: context.locale.foodDetailsScreenName,
          value: widget.item.designation ?? "",
        ),
        InkWell(
          onTap: () {
            context.pushRoute(
                FoodRestaurantRoute(marchant: widget.item.marchand!));
          },
          child: detailItem(
              title: context.locale.foodDetailsScreenSeller,
              value: widget.item.marchand?.designation ?? "",
              isColored: true),
        ),
        InkWell(
          onTap: () {
            context.pushRoute(const LocationPickerRoute());
          },
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16)),
                      color: AppColors.bgGreyD),
                  child: Text(
                    cart.longitude is double
                        ? '${cart.longitude!.toStringAsFixed(3)}, ${cart.latitude!.toStringAsFixed(3)}'
                        : context.locale.foodDetailsScreenAddGPSLocation,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    color: AppColors.alertWarning),
                child: Row(
                  children: [
                    const Icon(Icons.place, color: Colors.white),
                    Text(
                      'ADD',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // if (cart.quartier is! Quartier || cart.articles.isEmpty) ...[
        //   Text(
        //     context.locale.foodDetailsScreenAdress,
        //     style: Theme.of(context).textTheme.bodySmall,
        //   ),
        //   gapH4,
        //   Row(
        //     children: [
        //       Expanded(
        //         child: CustomDropdown<Quartier>.searchRequest(
        //           futureRequest: ref
        //               .watch(productsRepositoryProvider)
        //               .findFilterAllQuartierByPatter,
        //           decoration: CustomDropdownDecoration(
        //               closedShadow: [
        //                 const BoxShadow(color: Colors.white, spreadRadius: 3),
        //               ],
        //               closedBorder: Border.all(color: AppColors.primaryColor),
        //               closedFillColor: AppColors.bgBlue),
        //           hintText: context.locale.foodDetailsScreenSelectQuartier,
        //           headerBuilder: (context, val) => Text("${val.designation}"),
        //           items: allQuartier.value?.data
        //               .map((e) => e as Quartier)
        //               .toList(),
        //           listItemBuilder: (context, q, val, func) =>
        //               Text('${q.designation}'),
        //           onChanged: (value) {
        //             quartier = value;
        //             setState(() {});
        //           },
        //         ),
        //       ),
        //       if (allQuartier.isLoading ||
        //           allQuartier.isRefreshing ||
        //           allQuartier.isReloading)
        //         const Center(
        //             child: SizedBox(
        //                 height: 20,
        //                 width: 20,
        //                 child: CircularProgressIndicator(strokeWidth: 2)))
        //     ],
        //   ),
        //   gapH4,
        //   gapH4,
        //   Text(
        //     context.locale.foodDetailsScreenLocation,
        //     style: Theme.of(context).textTheme.bodySmall,
        //   ),
        //   gapH4,
        //   TextFormField(
        //     autovalidateMode: AutovalidateMode.onUserInteraction,
        //     controller: gpsLocationController,
        //     decoration: InputDecoration(
        //       hintText: context.locale.foodDetailsScreenExactDeliveryPosition,
        //     ),
        //     textInputAction: TextInputAction.done,
        //   ),
        //   gapH12,
        //   InkWell(
        //     onTap: () {
        //       context.pushRoute(const LocationPickerRoute());
        //     },
        //     child: Row(
        //       children: <Widget>[
        //         Expanded(
        //           child: Container(
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 16, horizontal: 24),
        //             decoration: const BoxDecoration(
        //                 borderRadius: BorderRadius.only(
        //                     topLeft: Radius.circular(16),
        //                     bottomLeft: Radius.circular(16)),
        //                 color: AppColors.bgGreyD),
        //             child: Text(
        //               cart.longitude is double
        //                   ? '${cart.longitude!.toStringAsFixed(3)}, ${cart.latitude!.toStringAsFixed(3)}'
        //                   : context.locale.foodDetailsScreenAddGPSLocation,
        //               style: Theme.of(context).textTheme.bodyLarge,
        //             ),
        //           ),
        //         ),
        //         Container(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        //           decoration: const BoxDecoration(
        //               borderRadius: BorderRadius.only(
        //                   topRight: Radius.circular(16),
        //                   bottomRight: Radius.circular(16)),
        //               color: AppColors.alertWarning),
        //           child: Row(
        //             children: [
        //               const Icon(Icons.place, color: Colors.white),
        //               Text(
        //                 'ADD',
        //                 style: Theme.of(context).textTheme.bodyLarge,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
        gapH20,
        ValueListenableBuilder(
            valueListenable: gpsLocationController,
            builder: (context, val, child) {
              return ElevatedButton(
                  onPressed:
                      // ((cart.quartier is! Quartier ||
                      //                 cart.articles.isEmpty) &&
                      //             val.text.isEmpty) ||
                      ref.watch(cartProvider).articles.indexWhere((element) =>
                                  element.article?.id == widget.item.id) !=
                              -1
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();

                              if (ref.watch(cartProvider).articles.indexWhere(
                                      (element) =>
                                          element.article?.id ==
                                          widget.item.id) !=
                                  -1) {
                                return await showErrorFlushbar(
                                    context,
                                    context.locale
                                        .foodDetailsScreenCartAlreadyContainsProduct);
                              }

                              // if (ref.watch(cartProvider).articles.indexWhere(
                              //         (element) =>
                              //             element.article?.marchand?.id ==
                              //             element.article?.marchand?.id) !=
                              //     -1) {
                              //   return await showErrorFlushbar(
                              //       context,
                              //       context.locale
                              //           .youCanSelectFromDifferentSeller);
                              // }

                              final client =
                                  ref.read(getCurrentClientProvider).value;

                              if (cart.articles.isEmpty) {
                                final progress = ProgressHUD.of(context);
                                progress?.show();

                                ref
                                    .read(createCommandPoductsNotifierProvider
                                        .notifier)
                                    .createCommand(CreateCommandRequest(
                                      localisationGps:
                                          cart.localisationGps ?? "",
                                      designation: widget.item.designation,
                                      latitude: cart.latitude,
                                      longitude: cart.longitude,
                                      // quartier: quartier,
                                      articles: [
                                        OrderArticle(
                                            article: widget.item,
                                            quantite: number)
                                      ],
                                      modePayement: "Automatique",
                                      // client: client,
                                    ))
                                    .whenComplete(() {
                                  progress?.dismiss();
                                });
                              } else {
                                final progress = ProgressHUD.of(context);
                                progress?.show();

                                ref
                                    .read(createCommandPoductsNotifierProvider
                                        .notifier)
                                    .updateCommand(cart.copyWith(
                                      designation: cart.articles
                                              .map(
                                                  (e) => e.article?.designation)
                                              .join(',') +
                                          (widget.item.designation ?? ""),
                                      articles: [
                                        ...cart.articles,
                                        OrderArticle(
                                            article: widget.item,
                                            quantite: number)
                                      ],
                                    ))
                                    .whenComplete(() => progress?.dismiss());
                              }
                            },
                  child: Text(context.locale.foodDetailsScreenAddToCart));
            }),
        gapH30,
      ],
    );
  }

  Column detailItem(
      {required String title, required String value, bool isColored = false}) {
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
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isColored == true ? AppColors.primaryColor : null),
        ),
        gapH12,
      ],
    );
  }
}
