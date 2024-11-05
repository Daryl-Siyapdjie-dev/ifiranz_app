import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client_request.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/auth/sign_in/shared/providers.dart';
import 'package:ifiranz_client/src/features/client/delivery/shared/providers.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/features/core/presentation/widgets/app_bars.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../core/infrastructure/utils/common_import.dart';
import '../application/delete_account_notifier.dart';
import 'delete_account_dialog.dart';

@RoutePage()
class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    ref.read(getCurrentClientProvider.notifier).getCurrentClient(ClientRequest(value: SharedPref.getEmail()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getCurrentClient = ref.watch(getCurrentClientProvider);
    return Scaffold(
      appBar: simpleBackAndTextAppBar(context.locale.myProfile),
      body: ListView(
        padding: const EdgeInsets.only(left: 17, right: 7, top: 23),
        children: [
          // Bloc d'informations du profil
          Container(
            decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(8)),
            child: getCurrentClient.when(
              error: (error, s) => Center(
                child: IconButton(
                  onPressed: () => ref.read(getCurrentClientProvider.notifier).getCurrentClient(ClientRequest(value: SharedPref.getEmail())),
                  icon: const Icon(Icons.refresh),
                ),
              ),
              loading: () => const LinearProgressIndicator(),
              data: (res) => ListTile(
                leading: const Icon(CupertinoIcons.person_alt_circle, size: 35, color: Colors.white),
                title: Text(
                  "${res.nom ?? ""} ${res.prenom ?? ""}",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.whiteColor),
                ),
                subtitle: Text(
                  res.user ?? "",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
          gapH32,
          const Divider(thickness: 1, color: AppColors.greyLight),
          gapH12,
          Row(
            children: [
              gapW25,
              Text(context.locale.settingsPreferences),
            ],
          ),
          gapH12,
          item(
            title: context.locale.language,
            icon: Icons.translate,
            onTap: () {
              context.pushRoute(const LanguageSelectorRoute());
            },
          ),
          gapH20,
          const Divider(),
          gapH20,
          item(
            title: context.locale.helpCenter,
            icon: Icons.help,
            onTap: () {
              context.pushRoute(const ReportBugRoute());
            },
          ),
          gapH20,
          item(
            title: context.locale.aboutUs,
            icon: Icons.info,
            onTap: () {
              context.pushRoute(const ReportBugRoute());
            },
          ),
          gapH20,
          item(
            title: context.locale.reportBug,
            icon: Icons.bug_report,
            onTap: () {
              context.pushRoute(const ReportBugRoute());
            },
          ),
          gapH32,
          gapH6,

          // Bouton de déconnexion
          Container(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                ref.read(userLocalCredentialsRepository).deleteUserLocalCredentials();
                ref.invalidate(cartProvider);
                ref.invalidate(getCurrentClientProvider);
                ref.invalidate(clientDeliveryOrdersNotifierProvider);
                AutoRouter.of(context).pushAndPopUntil(const SignInRoute(), predicate: (predicate) => false);
              },
              child: Row(
                children: [
                  Transform.rotate(angle: -135.1, child: const Icon(Icons.logout, color: AppColors.primaryColor)),
                  gapW5,
                  Text(context.locale.logOut, style: const TextStyle(color: AppColors.primaryColor)),
                ],
              ),
            ),
          ),

          // Nouveau bouton de suppression de compte
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => DeleteAccountDialog(
                    onConfirm: () async {
                      await ref.read(profileNotifierProvider.notifier).deleteAccount();
                      AutoRouter.of(context).pushAndPopUntil(const SignInRoute(), predicate: (route) => false);
                    },
                  ),
                );
              },
              child: Text(context.locale.deleteAccount),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ),
          ),
          gapH32,
          gapH6,
        ],
      ),
    );
  }

  Container item({required String title, required IconData icon, VoidCallback? onTap}) {
    return Container(
      decoration: BoxDecoration(color: AppColors.bgGreyLike, borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        onTap: onTap,
        title: Row(
          children: [
            gapW10,
            Icon(icon, color: AppColors.greyTextTitleColor),
            gapW6,
            Text(title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.greyTextTitleColor)),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.greyTextTitleColor, size: 9),
      ),
    );
  }
}
