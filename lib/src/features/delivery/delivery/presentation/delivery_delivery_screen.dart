import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ifiranz_client/src/features/core/domain/enum.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/string_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/utilities.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/application/pickup_otp_notifier.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/presentation/widget/livreur_map_screen.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/shared/providers.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/delivery/orders/presentation/widget/delivery_drawer_widget.dart';
import 'package:ifiranz_client/src/features/delivery/orders/shared/providers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../router/app_router.dart';
import '../../../core/infrastructure/utils/common_import.dart';

@RoutePage()
class DeliveryDeliveryScreen extends StatefulHookConsumerWidget {
  final Records? data;
  const DeliveryDeliveryScreen({
    super.key,
    this.data,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeliveryDeliveryScreenState();
}

class _DeliveryDeliveryScreenState extends ConsumerState<DeliveryDeliveryScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final deliveryOrders = ref.watch(deliveryOrdersNotifierProvider);

    final data = useState<Records?>(widget.data);

    final isPickup = useState(data.value?.statut == OrderStatus.enPreparation.value ? true : false);

    ref.listen<PickupState>(pickupNotifierProvider, (previous, next) {
      next.maybeWhen(
          orElse: () {},
          failed: (errorMessage) {
            showErrorFlushbar(context, errorMessage ?? "");
          },
          otpSendSuccess: (result) {
            context.pushRoute(PickUpOtpRoute(data: result));
          });
    });

    ref.listen(
      deliveryOrdersNotifierProvider,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          data: (res) {
            if (res.actionError is String) {
              showErrorFlushbar(context, res.actionError!);
            } else {
              isPickup.value = false;
            }
          },
        );
      },
    );

    useEffect(() {
      if (widget.data is Records) {
        deliveryOrders.whenData((value) {
          final res = value.data.where((element) => (element as Records).id == data.value?.id);
          if (res.isEmpty) return data.value = widget.data;

          data.value = res.first as Records;
        });
      }

      return null;
    }, [widget.data, isPickup.value]);
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ProgressHUD(
            barrierEnabled: true,
            borderWidth: 0,
            child: Builder(builder: (_) {
              return Scaffold(
                drawer: const DeliveryDrawerWidget(),
                key: _scaffoldKey,
                appBar: CustomDeliveryAppBar(
                  scaffoldKey: _scaffoldKey,
                ),
                body: Column(
                  children: [
                    Expanded(
                        flex: 5,
                        child: (data.value is Records || widget.data is Records)
                            ? LivreurMapScreen(
                                record: data.value ?? widget.data!,
                              )
                            : Container()),
                    Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                          color: stepOrderValidator(data.value?.statut, OrderStatus.accepte)
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
                                      color: stepOrderValidator(data.value?.statut, OrderStatus.enPreparation)
                                          ? AppColors.primaryColor
                                          : AppColors.bgGreyD,
                                    )),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: stepOrderValidator(data.value?.statut, OrderStatus.enPreparation)
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
                                      color: stepOrderValidator(data.value?.statut, OrderStatus.enCours) ? AppColors.primaryColor : AppColors.bgGreyD,
                                    )),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: stepOrderValidator(data.value?.statut, OrderStatus.enCours)
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
                                      color: stepOrderValidator(data.value?.statut, OrderStatus.livre) ? AppColors.primaryColor : AppColors.bgGreyD,
                                    )),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              stepOrderValidator(data.value?.statut, OrderStatus.livre) ? AppColors.primaryColor : AppColors.bgGreyD),
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
                              if (widget.data is Records)
                                Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(CupertinoIcons.person),
                                      title: Text(
                                        data.value?.commande?.localisationGps ?? "",
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                      subtitle: Text('${data.value?.commande?.client?.nom ?? ""} ${data.value?.commande?.client?.prenom ?? ""}',
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: data.value?.commande?.client?.tel == null ? AppColors.greyLight : AppColors.secondaryColor),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.phone,
                                                  color: AppColors.whiteColor,
                                                ),
                                                onPressed: data.value?.commande?.client?.tel == null
                                                    ? null
                                                    : () async {
                                                        final Uri telLaunchUri = Uri(
                                                          scheme: 'tel',
                                                          path: data.value!.commande!.client!.tel,
                                                        );
                                                        if (!await launchUrl(telLaunchUri)) {
                                                          throw Exception('Could not launch $telLaunchUri');
                                                        }
                                                      },
                                              )),
                                          gapW20,
                                          Expanded(
                                              child: ElevatedButton(
                                                  onPressed: data.value?.statut?.toLowerCase() == OrderStatus.livre.name.toLowerCase()
                                                      ? null
                                                      : () {
                                                          if (data.value?.code is! String) {
                                                            return;
                                                          }

                                                          if (isPickup.value &&
                                                              data.value?.statut?.toLowerCase() == OrderStatus.enPreparation.value.toLowerCase()) {
                                                            final progress = ProgressHUD.of(_);
                                                            progress?.show();

                                                            ref
                                                                .read(deliveryOrdersNotifierProvider.notifier)
                                                                .updateDeliveryOrder(widget.data!.id!)
                                                                .whenComplete(() => progress?.dismiss());
                                                          } else {
                                                            context.pushRoute(PickUpOtpRoute(data: widget.data!));
                                                          }
                                                        },
                                                  child: Text(isPickup.value &&
                                                          data.value?.statut?.toLowerCase() == OrderStatus.enPreparation.value.toLowerCase()
                                                      ? context.locale.pickup
                                                      : context.locale.deliveredVerd)))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              gapH30
                            ],
                          ),
                        )),
                  ],
                ),
              );
            })));
  }

  Container buildStatusContainer(OrderStatus status) {
    final color = AppColors.getColorForOrderStatus(status);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: AppColors.primaryShadow,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(status.name.capitalize().toString(), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.whiteColor)),
    );
  }
}
