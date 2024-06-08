import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_request.dart';
import 'package:ifiranz_client/src/features/core/domain/paginated_response.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/no_data.dart';
import 'package:ifiranz_client/src/features/merchant/products/domain/type/type_response.dart';
import 'package:ifiranz_client/src/features/merchant/products/shared/types_providers.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

@RoutePage()
class ManageTypesScreen extends StatefulHookConsumerWidget {
  const ManageTypesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManageTypesScreenState();
}

class _ManageTypesScreenState extends ConsumerState<ManageTypesScreen> {
  PaginatedRequest params = PaginatedRequest(page: 0, size: 40);

  @override
  void initState() {
    ref.read(merchandTypesNotifierProvider.notifier).getAllTypes(params);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final types = ref.watch(merchandTypesNotifierProvider);
    final controller = useScrollController();

    return Scaffold(
        appBar: const CustomMarchandAppBar(title: 'Types'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            context.pushRoute(const AddTypeRoute());
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        body: types.maybeWhen(
            orElse: () => Container(),
            error: (error, _) => Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SelectableText(error.toString()),
                )),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            data: (PaginatedResponse<TypeResponse> response) {
              return response.data.isEmpty
                  ? const NoData(
                      text: "No Data found",
                    )
                  : ListView(
                      controller: controller,
                      padding: const EdgeInsets.only(left: 24),
                      children: [
                          ...response.data.map((e) => itemWidget(e)),
                          if ((types.value?.data.length ?? 0) % params.size ==
                              0)
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 25),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          if (types.value?.hasErrorOnLoadMore == true)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(merchandTypesNotifierProvider
                                            .notifier)
                                        .getAllTypes(
                                            params.copyWith(page: params.page));
                                  },
                                  icon: const Icon(Icons.refresh),
                                ),
                              ),
                            )
                        ]);
            }));
  }

  Widget itemWidget(TypeResponse val) {
    return ListTile(
      title: Text(val.designation),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(val.code is String ? '#${val.code}' : ''),
          const Divider()
        ],
      ),
      trailing:
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.pen)),
    );
  }
}
