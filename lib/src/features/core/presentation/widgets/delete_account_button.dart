import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/toats.dart';

import '../../../../router/app_router.dart';
import '../../../profile/application/profile_notifier.dart';
import '../../../profile/application/providers.dart';
import '../../../profile/presentation/widgets/delete_account_dialog.dart';
import '../../infrastructure/utils/api_constants.dart';
import '../themes/app_colors.dart';

class DeleteAccountButton extends ConsumerWidget {

  final BuildContext loaderContext;
  const DeleteAccountButton(this.loaderContext, {Key? key}) : super(key: key);

  Future<void> _showDeleteConfirmationDialog(BuildContext context,BuildContext _, WidgetRef ref) async {
   await showDialog(
      context: context,
      builder: (context) => DeleteAccountDialog(
        onConfirm: () async {
          final progress = ProgressHUD.of(_);

          progress?.show();

         await ref.read(profileNotifierProvider.notifier).deleteAccount();

          progress?.dismiss();


        },
      ),
    );


  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    ref.listen(
      profileNotifierProvider,
          (previous, next) {
        next.maybeMap(
            orElse: () {},
            error: (error) {
              Flushbar(
                message: "${error.error}",
                icon: const Icon(
                  Icons.info,
                  color: AppColors.alertError,
                ),
                borderRadius: BorderRadius.circular(10),
                backgroundColor: AppColors.bgRed,
                messageColor: AppColors.alertError,
                duration:
                const Duration(seconds: ApiConstants.flushbarDuration),
                margin: const EdgeInsets.all(16),
              ).show(context);
            },
            data: (res){

         SharedPref.clear();
              showSuccessFlushbar(context, context.locale.operationSuccess)
                  .then((value) {
                AutoRouter.of(context).pushAndPopUntil(const SignInRoute(),
                    predicate: (predicate) => false);
              });
            });
      },
    );


    return  ElevatedButton(
        onPressed: () =>
            _showDeleteConfirmationDialog(context,loaderContext, ref),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          textStyle: Theme
              .of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
        child:  Text(context.locale.deleteAccount),
      );

  }
}
