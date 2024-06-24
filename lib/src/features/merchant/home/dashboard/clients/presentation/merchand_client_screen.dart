import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/no_data.dart';
import 'package:ifiranz_client/src/features/merchant/core/presentation/widget/order_drawer_widget.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/shared/providers.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class MerchandClientScreen extends StatefulHookConsumerWidget {
  const MerchandClientScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchandClientScreenState();
}

class _MerchandClientScreenState extends ConsumerState<MerchandClientScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PaginatedRequest params = PaginatedRequest(page: 0, size: 20);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.microtask(() {
        ref
            .refresh(merchandClientsNotifierProvider.notifier)
            .fetchMerchantClients(params);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(merchandClientsNotifierProvider);
    final controller = useScrollController();

    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        if (ref.watch(merchandClientsNotifierProvider).hasValue &&
            (ref.watch(merchandClientsNotifierProvider).value!.hasMore) &&
            !(ref
                .watch(merchandClientsNotifierProvider)
                .value!
                .isLoadingMore)) {
          await ref
              .read(merchandClientsNotifierProvider.notifier)
              .fetchMerchantClients(params.copyWith(page: params.page + 1),
                  isMore: true)
              .whenComplete(() {
            if (!(ref
                .watch(merchandClientsNotifierProvider)
                .value!
                .hasErrorOnLoadMore)) {
              setState(() {
                params = params.copyWith(page: params.page + 1);
              });
            }
          });
        }
      }
    });
    return RefreshIndicator(
      onRefresh: () => ref
          .read(merchandClientsNotifierProvider.notifier)
          .fetchMerchantClients(PaginatedRequest(page: 0, size: 7)),
      child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomMarchandAppBar(
            title: context.locale.merchandHomeScreenClients,
            scaffoldKey: _scaffoldKey,
            actionnable: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              context.pushRoute(const CreateMerchandAddRoute());
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
          body: orders.when(
            data: (response) {
              return response.data.isEmpty
                  ? NoData(
                      text: context.locale.noDataText,
                    )
                  : ListView(
                      controller: controller,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: [
                        ...response.data.map((e) => clientItem(e)).toList(),
                        gapH10,
                        if (((ref
                                    .watch(merchandClientsNotifierProvider)
                                    .value
                                    ?.hasMore ??
                                false) ||
                            (ref
                                    .watch(merchandClientsNotifierProvider)
                                    .value
                                    ?.isLoadingMore ??
                                false)))
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if ((ref
                                .watch(merchandClientsNotifierProvider)
                                .value
                                ?.hasErrorOnLoadMore ??
                            false))
                          Center(
                            child: IconButton(
                              icon: const Icon(Icons.refresh),
                              onPressed: () async {
                                await ref
                                    .read(merchandClientsNotifierProvider
                                        .notifier)
                                    .fetchMerchantClients(
                                        params.copyWith(page: params.page + 1),
                                        isMore: true)
                                    .whenComplete(() {
                                  if (!(ref
                                      .watch(merchandClientsNotifierProvider)
                                      .value!
                                      .hasErrorOnLoadMore)) {
                                    setState(() {
                                      params = params.copyWith(
                                          page: params.page + 1);
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                        gapH64
                      ],
                    );
            },
            error: (error, _) => Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SelectableText(error.toString()),
            )),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          drawer: const OrdinaryDrawerWidget()),
    );
  }

  Widget clientItem(Client item) {
    return InkWell(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.bgGreyContainer,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.containerShadow,
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${item.code ?? ""}',
                    style: const TextStyle(color: AppColors.blackColor),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          context.locale.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.greyTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(item.nom ?? "",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                      )
                    ],
                  ),
                  gapH2,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          context.locale.surname,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.greyTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text((item.prenom ?? "").capitalize(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                      )
                    ],
                  ),
                  gapH2,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          context.locale.address,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.greyTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text((item.adresse ?? "").capitalize(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                      )
                    ],
                  ),
                  gapH2,
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          context
                              .locale.registerAdditionnalLocationNeighborhood,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.greyTextColor),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text((item.localisationGps ?? "").capitalize(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                      )
                    ],
                  ),
                ])));
  }
}
