import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ifiranz_client/src/features/client/delivery/presentation/widget/client_map_screen.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/utilities.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/domain/enum.dart';
import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class ClientDeliveryScreen extends StatefulHookConsumerWidget {
  final bool isMerchant;
  final Records data;
  const ClientDeliveryScreen({super.key, required this.data, this.isMerchant = false});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClientDeliveryScreenState();
}

class _ClientDeliveryScreenState extends ConsumerState<ClientDeliveryScreen> {
  late Records data = widget.data;
  void handleUpadteStatus(OrderStatus status) {
    setState(() {
      data = data.copyWith(commande: data.commande?.copyWith(statut: status.value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.isMerchant
          ? CustomMarchandAppBar(title: context.locale.delivery)
          : CustomAppBar(
              title: context.locale.delivery,
            )) as PreferredSizeWidget,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: TestClientMapScreen(
              record: data,
              handleUpadteStatus: handleUpadteStatus,
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: SingleChildScrollView(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      if (widget.data.otp is String)
                        Text(
                          context.locale.deliveryCodeIs(widget.data.otp ?? ""),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      gapH10,
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: stepOrderValidator(widget.data.statut!, OrderStatus.accepte) ? AppColors.primaryColor : AppColors.bgGreyD),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.bgGreyD,
                                size: 12,
                              ),
                            ),
                            Expanded(
                                child: Divider(
                              color: stepOrderValidator(widget.data.statut!, OrderStatus.enPreparation) ? AppColors.primaryColor : AppColors.bgGreyD,
                            )),
                            Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: stepOrderValidator(widget.data.statut!, OrderStatus.enPreparation)
                                      ? AppColors.primaryColor
                                      : AppColors.bgGreyD),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.bgGreyD,
                                size: 12,
                              ),
                            ),
                            Expanded(
                                child: Divider(
                              color: stepOrderValidator(widget.data.statut!, OrderStatus.enCours) ? AppColors.primaryColor : AppColors.bgGreyD,
                            )),
                            Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: stepOrderValidator(widget.data.statut!, OrderStatus.enCours) ? AppColors.primaryColor : AppColors.bgGreyD),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.bgGreyD,
                                size: 12,
                              ),
                            ),
                            Expanded(
                                child: Divider(
                              color: stepOrderValidator(widget.data.statut!, OrderStatus.livre) ? AppColors.primaryColor : AppColors.bgGreyD,
                            )),
                            Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: stepOrderValidator(widget.data.statut!, OrderStatus.livre) ? AppColors.primaryColor : AppColors.bgGreyD),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.bgGreyD,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      gapH8,
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                context.locale.accepted,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                context.locale.cooking,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                context.locale.pickup,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                context.locale.delivered,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          )
                        ],
                      ),
                      ListTile(
                        leading: SizedBox(
                          height: 40,
                          width: 40,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                imageUrl: widget.data.livreur?.url ?? "http://via.placeholder.com/350x150",
                                progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(value: downloadProgress.progress),
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              )),
                        ),
                        title: Text(
                          context.locale.delivered,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        subtitle: Text('${widget.data.livreur?.nom ?? ""} ${widget.data.livreur?.prenom ?? ""}',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: widget.data.livreur?.telephone1 == null ? AppColors.greyLight : AppColors.secondaryColor),
                        icon: const Icon(
                          Icons.phone,
                          color: AppColors.whiteColor,
                        ),
                        label: Text(widget.data.livreur?.telephone1 ?? "+237XXXXX"),
                        onPressed: widget.data.livreur?.telephone1 == null
                            ? null
                            : () async {
                                final Uri telLaunchUri = Uri(
                                  scheme: 'tel',
                                  path: widget.data.livreur?.telephone1,
                                );
                                if (!await launchUrl(telLaunchUri)) {
                                  throw Exception('Could not launch $telLaunchUri');
                                }
                              },
                      ),
                      gapH10,
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: widget.data.livreur?.telephone2 == null ? AppColors.greyLight : AppColors.secondaryColor),
                        icon: const Icon(
                          Icons.phone,
                          color: AppColors.whiteColor,
                        ),
                        label: Text(widget.data.livreur?.telephone2 ?? "+237XXXXX"),
                        onPressed: widget.data.livreur?.telephone2 == null
                            ? null
                            : () async {
                                final Uri telLaunchUri = Uri(
                                  scheme: 'tel',
                                  path: widget.data.livreur?.telephone2,
                                );
                                if (!await launchUrl(telLaunchUri)) {
                                  throw Exception('Could not launch $telLaunchUri');
                                }
                              },
                      )
                    ]),
                  )))
        ],
      ),
    );
  }
}
