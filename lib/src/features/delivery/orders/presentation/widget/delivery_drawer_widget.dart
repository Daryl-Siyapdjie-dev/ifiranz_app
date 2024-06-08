import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/auth/sign_in/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../../../../auth/core/shared/provider.dart';
import '../../../../client/home/domain/filter_optional.dart';
import '../../../../core/infrastructure/services/local/shared_pref.dart';

class DeliveryDrawerWidget extends StatefulHookConsumerWidget {
  const DeliveryDrawerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DeliveryDrawerWidgetState();
}

class _DeliveryDrawerWidgetState extends ConsumerState<DeliveryDrawerWidget> {
  @override
  void initState() {
    ref
        .read(currentDeliverNotifierProvider.notifier)
        .getCurrentLivreur(FilterOptional.fromJson({"key": "user", "value": SharedPref.getEmail(), "type": "EQUAL", "applyAnd": true}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livreur = ref.watch(currentDeliverNotifierProvider);

    return Drawer(
        child: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.bgGreyIcon,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/back.svg",
                      colorFilter: const ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
                    ),
                  )),
              gapW32,
              Text(
                context.locale.myProfile,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 24),
              ),
              const Spacer(),
            ],
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.symmetric(vertical: 28),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.bgGreyLike),
              child: Column(children: [
                Container(
                  height: 85,
                  width: 85,
                  margin: const EdgeInsets.only(right: 24, left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: livreur.hasValue && livreur.value?.url is String
                        ? CachedNetworkImage(
                            imageUrl: livreur.value?.url ?? "http://via.placeholder.com/350x150",
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          )
                        : livreur.value?.url is! String
                            ? Container()
                            : const CircularProgressIndicator(),
                  ),
                ),
                Text(
                  livreur.value?.designation ?? '',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  livreur.value?.user ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
                gapH8,
              ])),
          const Divider(
            height: 1,
          ),

          const Divider(),
          gapH20,
          // ListTile(
          //   leading: const Icon(Icons.notifications),
          //   title: const Text('Notifications'),
          //   trailing: IconButton(
          //       icon: Transform.rotate(
          //         angle: -33,
          //         child: const Icon(
          //           Icons.arrow_back_ios,
          //           size: 9,
          //         ),
          //       ),
          //       onPressed: () {}),
          // ),
          ListTile(
              leading: const Icon(Icons.translate),
              onTap: () {
                context.pushRoute(const LanguageSelectorRoute());
              },
              title: Text(context.locale.language),
              trailing: Transform.rotate(
                  angle: 66,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 9,
                  ))),
          gapH20,
          const Divider(),
          gapH20,
          ListTile(
            leading: const Icon(Icons.help),
            title: Text(context.locale.helpCenter),
            trailing: Transform.rotate(
              angle: 66,
              child: const Icon(
                Icons.arrow_back_ios,
                size: 9,
              ),
            ),
          ),
          ListTile(
              onTap: () {
                context.pushRoute(const ReportBugRoute());
              },
              leading: const Icon(Icons.bug_report),
              title: Text(context.locale.reportBug),
              trailing: Transform.rotate(
                angle: 66,
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 9,
                ),
              )),
          gapH6,
          Container(
              alignment: Alignment.centerLeft,
              child: Consumer(
                  builder: (_, ref, __) => TextButton(
                      onPressed: () {
                        ref.read(userLocalCredentialsRepository).deleteUserLocalCredentials();
                        AutoRouter.of(context).pushAndPopUntil(const SignInRoute(), predicate: (predicate) => false);
                      },
                      child: Row(
                        children: [
                          Transform.rotate(angle: -135.1, child: const Icon(Icons.logout, color: AppColors.primaryColor)),
                          gapW5,
                          Text(
                            context.locale.logOut,
                            style: const TextStyle(color: AppColors.primaryColor),
                          ),
                        ],
                      )))),
          gapH32,
          gapH6,
        ],
      ),
    ));
  }
}
