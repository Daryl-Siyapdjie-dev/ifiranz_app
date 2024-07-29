import 'package:auto_route/auto_route.dart';

import '../../../../../core/infrastructure/constants/app_sizes.dart';
import '../../../../../core/infrastructure/utils/common_import.dart';
import '../../../../../core/presentation/themes/app_colors.dart';
import '../../../../../core/presentation/widgets/app_bars.dart';
import '../../../../../core/presentation/widgets/no_data.dart';
import '../../../../../delivery/orders/domain/commission_model.dart';

@RoutePage()
class MerchandCommissionScreen extends StatefulHookConsumerWidget {
  final Commissions? commissions;
  const MerchandCommissionScreen({super.key, this.commissions});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MerchandCommissionScreenState();
}

class _MerchandCommissionScreenState
    extends ConsumerState<MerchandCommissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMarchandAppBar(
        title: 'Commissions',
      ),
      body: widget.commissions == null || widget.commissions!.content!.isEmpty
          ? const NoData(text: "Aucune donnee trouve")
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.commissions!.content?.length ?? 0,
              itemBuilder: (context, i) =>
                  clientItem(widget.commissions!.content![i]),
            ),
    );
  }

  Widget clientItem(CommissionModel commissionModel) {
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
                    '#${commissionModel.code ?? ""}',
                    style: const TextStyle(color: AppColors.blackColor),
                  ),
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "CommandCode:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(commissionModel.commandCode ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.blackColor)),
                      ),
                    ],
                  ),
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "Date:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(commissionModel.date ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.blackColor)),
                      ),
                    ],
                  ),
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "heure:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(
                          commissionModel.time?.split(".").first ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.blackColor),
                        ),
                      ),
                    ],
                  ),
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "Paye:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(commissionModel.paid! ? "Oui" : "Non",
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: commissionModel.paid!
                                          ? AppColors.alertInfo
                                          : AppColors.errorColor,
                                    )),
                      ),
                    ],
                  ),
                  gapH2,
                  gapH2,
                  Row(
                    children: [
                      Text(
                        "Montant:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.greyTextColor),
                      ),
                      gapW10,
                      Expanded(
                        child: Text(
                            '${commissionModel.commandAmount ?? ""} XAF',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.blackColor)),
                      ),
                    ],
                  ),
                  gapH2,
                ])));
  }
}
