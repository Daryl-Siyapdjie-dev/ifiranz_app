import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/auth/sign_in/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

class OrdinaryDrawerWidget extends StatefulHookConsumerWidget {
  const OrdinaryDrawerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdinaryDrawerWidgetState();
}

class _OrdinaryDrawerWidgetState extends ConsumerState<OrdinaryDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final merchand = ref.watch(currentMarchandNotifierProvider);

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
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: merchand.value?.url ?? "http://via.placeholder.com/350x150",
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  merchand.value?.designation ?? "",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  merchand.value?.user ?? "",
                  style: const TextStyle(fontSize: 12),
                ),
                gapH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7)),
                          onPressed: () {
                            context.pushRoute(const EditMerchandRoute());
                          },
                          child: Text(
                            context.locale.edit,
                            style: const TextStyle(fontSize: 10),
                          )),
                    ),
                    const Spacer()
                  ],
                )
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
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

                        ref.invalidate(currentMarchandNotifierProvider);
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
