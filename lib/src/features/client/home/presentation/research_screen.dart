import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/no_data.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/product_item.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';

import '../../../core/domain/paginated_request.dart';
import '../../../core/infrastructure/constants/app_sizes.dart';
import '../../../core/infrastructure/services/local/shared_pref.dart';
import '../../../core/presentation/themes/app_colors.dart';
import '../../../merchant/products/domain/type/type_response.dart';
import '../../../merchant/products/shared/types_providers.dart';
import '../shared/providers.dart';

@RoutePage()
class ResearchScreen extends StatefulHookConsumerWidget {
  const ResearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResearchScreenState();
}

class _ResearchScreenState extends ConsumerState<ResearchScreen> {
  List<String> recentSearch = [];

  Future<void> updateSearchHistory() async {
    List<String>? updatedHistory = await SharedPref.getLocalClientSearchHistory;
    if (updatedHistory != null) {
      setState(() {
        recentSearch = updatedHistory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final search = useTextEditingController();
    final filterSearchs = useState<List<FilterOptional>>(
        [FilterOptional(value: search.text, type: "LIKE", key: "designation")]);

    final findByDesignation = ref.watch(findByDesignationPoductsProvider);

    useEffect(() {
      SharedPref.getLocalClientSearchHistory.then((value) {
        setState(() {
          recentSearch = value ?? [];
        });
      });
      return;
    }, [search.text]);

    ref.listen(findByDesignationPoductsProvider, (previous, next) {
      next.maybeMap(
          orElse: () {},
          error: (e) {
            showErrorFlushbar(context, e.toString());
          });
    });

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.greyBackground),
                        child: InkWell(
                            onTap: context.popRoute,
                            child: SvgPicture.asset('assets/icons/back.svg')),
                      ),
                    ],
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: search,
                        onEditingComplete: () async {
                          if (search.text.isEmpty) return;
                          FocusScope.of(context).unfocus();
                          final progress = ProgressHUD.of(_);
                          progress?.show();
                          ref
                              .read(findByDesignationPoductsProvider.notifier)
                              .findProductByDesignation(filterSearchs.value
                                  .map((element) => element.key == "designation"
                                      ? element.copyWith(
                                          value: search.text.trim())
                                      : element)
                                  .toList())
                              .whenComplete(() async {
                            progress!.dismiss();

                            await SharedPref
                                .addSingleItemToLocalClientSearchHistory(
                                    search.text);
                            search.clear();
                            await updateSearchHistory();
                          });
                        },
                        decoration: InputDecoration(
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColors.greyTextColor),
                            prefixIcon: const Icon(Icons.search),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 9.5),
                            isDense: true,
                            hintText: 'TARO'),
                      )),
                      gapW18,
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.bgGreyIcon,
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 11, horizontal: 14),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const SearchFilterWidget());
                            },
                            icon: SvgPicture.asset(
                                'assets/icons/icon-park-outline_setting-config.svg')),
                      )
                    ],
                  ),
                ),
                body: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 43, top: 6, right: 43),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Recent search',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () async {
                                    await SharedPref
                                        .clearLocalClientSearchHistory();
                                    updateSearchHistory();
                                  },
                                  child: Text(
                                    'Delete all',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ))
                            ],
                          ),
                          gapH12,
                          Wrap(
                            children: recentSearch
                                .map((e) => previousSearchItem(e, search, _))
                                .toList(),
                          )
                        ],
                      ),
                    ),
                    findByDesignation.when(
                        error: (error, s) => Center(
                            child: IconButton(
                                onPressed: () => ref.refresh(
                                    findByDesignationPoductsProvider.notifier),
                                icon: const Icon(Icons.refresh))),
                        loading: () => const Center(),
                        data: (res) => res.data.isEmpty
                            ? const NoData(text: 'Nothing for this one')
                            : Padding(
                                padding: const EdgeInsets.only(
                                    top: 13, left: 36, right: 36),
                                child: MasonryGridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: res.data.length,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  itemBuilder: (context, index) {
                                    return ProductItem(meal: res.data[index]);
                                  },
                                ),
                              ))
                  ],
                ),
              );
            })));
  }

  Widget previousSearchItem(
      String e, TextEditingController search, BuildContext _) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: e == search.text ? AppColors.primaryColor : AppColors.bgGreyD),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      child: InkWell(
        onTap: () {
          final progress = ProgressHUD.of(_);
          progress?.show();
          ref
              .read(findByDesignationPoductsProvider.notifier)
              .findProductByDesignation([
            FilterOptional(value: e, type: "LIKE", key: "designation")
          ]).whenComplete(() {
            progress!.dismiss();
          });
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                e,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: e == search.text
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor),
              ),
              gapW8,
              InkWell(
                onTap: () async {
                  await SharedPref.removeItemFromLocalClientSearchHistory(e);
                  await updateSearchHistory();
                },
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.whiteColor),
                    child: const Icon(
                      Icons.close,
                      size: 12,
                    )),
              )
            ]),
      ),
    );
  }
}

class SearchFilterWidget extends ConsumerStatefulWidget {
  const SearchFilterWidget({
    super.key,
  });

  @override
  ConsumerState createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends ConsumerState<SearchFilterWidget> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 40);
  TypeResponse? type;
  Merchant? marchand;

  @override
  void initState() {
    ref.read(merchandTypesNotifierProvider.notifier).getAllTypes(params);
    ref.read(findAllMarchandNotifier.notifier).getAllMarchand(params);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final types = ref.watch(merchandTypesNotifierProvider);
    final marchands = ref.watch(findAllMarchandNotifier);

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Dialog(
                backgroundColor: AppColors.whiteColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Type de produits'),
                          gapH4,
                          types.maybeWhen(
                              orElse: () => Container(),
                              error: (e, s) => IconButton(
                                  onPressed: () => ref
                                      .read(merchandTypesNotifierProvider
                                          .notifier)
                                      .getAllTypes(params),
                                  icon: const Icon(Icons.refresh)),
                              loading: () => const LinearProgressIndicator(),
                              data: (res) => res.data.isEmpty
                                  ? Container()
                                  : CustomDropdown<TypeResponse>.search(
                                      hintText: 'Type de produits',
                                      decoration: CustomDropdownDecoration(
                                          closedShadow: [
                                            const BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 5),
                                          ],
                                          closedBorder: Border.all(
                                              color: AppColors.bgGreyD),
                                          closedBorderRadius:
                                              BorderRadius.circular(8),
                                          hintStyle: Theme.of(context)
                                              .inputDecorationTheme
                                              .hintStyle,
                                          headerStyle: GoogleFonts.urbanist(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                    color: AppColors.blackColor,
                                                  )
                                                  .color),
                                          closedFillColor: Theme.of(context)
                                              .inputDecorationTheme
                                              .fillColor),
                                      items: res.data as List<TypeResponse>,
                                      listItemBuilder:
                                          (context, q, val, func) =>
                                              Text(q.designation),
                                      headerBuilder: (context, val) =>
                                          Text(val.designation),
                                      onChanged: (elt) {
                                        setState(() {
                                          type = elt;
                                        });
                                      })),
                          gapH12,
                          const Text('Marchands'),
                          gapH12,
                          marchands.maybeWhen(
                              orElse: () => Container(),
                              error: (e, s) => IconButton(
                                  onPressed: () => ref
                                      .read(findAllMarchandNotifier.notifier)
                                      .getAllMarchand(params),
                                  icon: const Icon(Icons.refresh)),
                              loading: () => const LinearProgressIndicator(),
                              data: (res) => res.isEmpty
                                  ? Container()
                                  : CustomDropdown<Merchant>.search(
                                      hintText: 'Marchands',
                                      decoration: CustomDropdownDecoration(
                                          closedShadow: [
                                            const BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 5),
                                          ],
                                          closedBorder: Border.all(
                                              color: AppColors.bgGreyD),
                                          closedBorderRadius:
                                              BorderRadius.circular(8),
                                          hintStyle: Theme.of(context)
                                              .inputDecorationTheme
                                              .hintStyle,
                                          headerStyle: GoogleFonts.urbanist(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                    color: AppColors.blackColor,
                                                  )
                                                  .color),
                                          closedFillColor: Theme.of(context)
                                              .inputDecorationTheme
                                              .fillColor),
                                      items: res,
                                      listItemBuilder:
                                          (context, q, val, func) =>
                                              Text(q.designation ?? ""),
                                      headerBuilder: (context, val) =>
                                          Text(val.designation ?? ""),
                                      onChanged: (elt) {
                                        setState(() {
                                          marchand = elt;
                                        });
                                      })),
                          gapH12,
                          gapH12,
                          ElevatedButton(
                              onPressed: (type is! TypeResponse &&
                                      marchand is! Merchant)
                                  ? null
                                  : () {
                                      final progress = ProgressHUD.of(_);
                                      progress?.show();
                                      ref
                                          .read(findByDesignationPoductsProvider
                                              .notifier)
                                          .findProductByDesignation([
                                        if (type is TypeResponse)
                                          FilterOptional(
                                              type: "EQUAL",
                                              key: "code",
                                              value: type!.designation,
                                              aliasKey: "type.designation"),
                                        if (marchand is Merchant)
                                          FilterOptional(
                                              type: "EQUAL",
                                              key: "code",
                                              value: marchand!.designation,
                                              aliasKey: "marchand.designation",
                                              applyAnd: ((type
                                                          is TypeResponse &&
                                                      (marchand is Merchant))
                                                  ? true
                                                  : null))
                                      ]).whenComplete(() {
                                        progress!.dismiss();
                                        Navigator.of(context).pop();
                                      });
                                    },
                              child: const Text('Search'))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
