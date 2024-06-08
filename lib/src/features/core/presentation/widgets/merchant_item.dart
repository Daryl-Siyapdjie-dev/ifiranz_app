import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ifiranz_client/src/features/client/home/domain/infrastructur_model.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/media_query_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/utils.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../infrastructure/utils/common_import.dart';

class MerchantItem extends StatefulHookConsumerWidget {
  final InfrastructurModel merchant;

  const MerchantItem({
    super.key,
    required this.merchant,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MerchantItemState();
}

class _MerchantItemState extends ConsumerState<MerchantItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushRoute(MerchantProductRoute(infra: widget.merchant));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, -8),
              blurRadius: 24,
              color: AppColors.primaryShadow,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      Container(
                          constraints: BoxConstraints(
                            minHeight: 96,
                            maxHeight: context.proportionnalHeight(204),
                          ),
                          child: Hero(
                              tag: widget.merchant.id,
                              child: CachedNetworkImage(
                                imageUrl: widget.merchant.url.isNotEmpty
                                    ? widget.merchant.url
                                    : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/220px-Barbieri_-_ViaSophia25668.jpg",
                                // "http://via.placeholder.com/350x150",
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ))),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.bgGreyItem,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.merchant.designation ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  if (widget.merchant.adresse != null &&
                      widget.merchant.adresse!.isNotEmpty)
                    Column(
                      children: [
                        const SizedBox(height: 4),
                        InkWell(
                          onTap: () {
                            context.pushRoute(
                              MerchantProductRoute(infra: widget.merchant),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.merchant.designation ?? "",
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (widget.merchant.telephone1.isEmpty ||
                      (widget.merchant.telephone2 != null &&
                          widget.merchant.telephone2!.isNotEmpty))
                    Column(
                      children: [
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, bottom: 8),
                              child: Text(
                                widget.merchant.telephone1.isNotEmpty
                                    ? widget.merchant.telephone1.toString()
                                    : widget.merchant.telephone2.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
