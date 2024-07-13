import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/client/home/shared/providers.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/router/app_router.dart';

import '../themes/app_colors.dart';

AppBar simpleBackAppBar() {
  return AppBar(
    centerTitle: false,
    leadingWidth: double.infinity,
    leading: Builder(builder: (context) {
      return Row(
        children: [
          InkWell(
              onTap: () {
                AutoRouter.of(context).pop();
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 24, top: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.bgGreyIcon,
                ),
                child: SvgPicture.asset(
                  "assets/icons/back.svg",
                  colorFilter: const ColorFilter.mode(
                      AppColors.blackColor, BlendMode.srcIn),
                ),
              )),
        ],
      );
    }),
  );
}

AppBar simpleBackAndTextAppBar(String title) {
  return AppBar(
    centerTitle: false,
    leadingWidth: double.infinity,
    leading: Builder(builder: (context) {
      return Row(
        children: [
          InkWell(
              onTap: () {
                AutoRouter.of(context).pop();
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 24, top: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.bgGreyIcon,
                ),
                child: SvgPicture.asset(
                  "assets/icons/back.svg",
                  colorFilter: const ColorFilter.mode(
                      AppColors.blackColor, BlendMode.srcIn),
                ),
              )),
          gapW30,
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      );
    }),
  );
}

class CustomAppBar extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final bool isHome;
  final PreferredSizeWidget? appBar;
  final bool canPop;
  final bool isDelivery;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const CustomAppBar(
      {super.key,
      this.title,
      this.action,
      this.isHome = false,
      this.canPop = true,
      this.isDelivery = false,
      this.scaffoldKey,
      this.appBar});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight((title is String || appBar is TabBar)
          ? kToolbarHeight * 2
          : kToolbarHeight);
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          if (widget.isHome)
            GestureDetector(
              onTap: () {
                context.pushRoute(const ProfileRoute());
              },
              child: const Icon(
                Icons.account_circle_rounded,
                size: 40,
              ),
            ),
          if (!widget.isHome)
            Image.asset(
              "assets/images/splash.png",
              height: 32,
            ),
          const Spacer()
        ],
      ),
      actions: [
        if (widget.isHome)
          IconButton(
            onPressed: () {
              // context.pushRoute(const ResearchRoute());
            },
            icon: Image.asset("assets/icons/bell.png"),
          ),
        if (widget.isDelivery)
          InkWell(
            onTap: () {
              widget.scaffoldKey?.currentState?.openDrawer();
            },
            child: Container(
              height: 35,
              width: 35,
              margin: const EdgeInsets.only(right: 24, left: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/fake_profile.png"),
                ),
              ),
            ),
          )
        else
          IconButton(
            onPressed: () {
              if (context.router.current.name != CartRoute.name) {
                Future.delayed(const Duration(milliseconds: 100), () {
                  context.pushRoute(const CartRoute());
                });
                // context.pushRoute(const CartRoute());
              }
            },
            icon: Badge(
              label: Text(cart.articles.length.toString()),
              backgroundColor: AppColors.primaryColor,
              child: Image.asset(
                "assets/icons/cart.png",
                width: 25.0,
              ),
            ),
          ),
        gapW10
      ],
      bottom: widget.appBar is Widget
          ? widget.appBar
          : widget.title is String
              ? AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leadingWidth: 70,
                  leading: widget.canPop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: context.popRoute,
                              icon: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.greyBackground,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/back.svg',
                                ),
                              ),
                            ),
                          ],
                        )
                      : null,
                  title: Text(widget.title!),
                  actions: [if (widget.action is Widget) widget.action!],
                )
              : null,
    );
  }
}

class CustomMarchandAppBar extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  final String? title;
  final Widget? action, leading;
  final bool isHome;
  final bool canPop, actionnable;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const CustomMarchandAppBar({
    super.key,
    this.title,
    this.action,
    this.leading,
    this.isHome = false,
    this.canPop = true,
    this.actionnable = false,
    this.scaffoldKey,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomMarchandAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(title is String ? kToolbarHeight * 2 : kToolbarHeight);
}

class _CustomMarchandAppBarState extends ConsumerState<CustomMarchandAppBar> {
  @override
  void initState() {
    ref.read(currentMarchandNotifierProvider.notifier).getCurrentMarchand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final merchand = ref.watch(currentMarchandNotifierProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            "assets/images/splash.png",
            height: 32,
          ),
          const Spacer(),
        ],
      ),
      actions: [
        if (widget.actionnable)
          InkWell(
            onTap: () {
              widget.scaffoldKey?.currentState?.openDrawer();
            },
            child: Container(
              height: 35,
              width: 35,
              margin: const EdgeInsets.only(right: 24, left: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: merchand.hasValue && merchand.value?.url is String
                    ? CachedNetworkImage(
                        imageUrl: merchand.value?.url ??
                            "http://via.placeholder.com/350x150",
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : merchand.value?.url is! String
                        ? Container()
                        : const CircularProgressIndicator(),
              ),
            ),
          )
      ],
      bottom: widget.title is String
          ? AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              leadingWidth: 70,
              leading: widget.leading is Widget
                  ? widget.leading
                  : widget.canPop
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: context.popRoute,
                              icon: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.greyBackground,
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/back.svg',
                                ),
                              ),
                            ),
                          ],
                        )
                      : null,
              title: Text(widget.title!),
              actions: [if (widget.action is Widget) widget.action!],
            )
          : null,
    );
  }
}

class CustomDeliveryAppBar extends StatefulHookConsumerWidget
    implements PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final Widget? leading;
  final bool isHome;
  final bool canPop, actionnable;
  final AppBar? appBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const CustomDeliveryAppBar(
      {super.key,
      this.title,
      this.action,
      this.leading,
      this.isHome = false,
      this.canPop = true,
      this.actionnable = false,
      this.scaffoldKey,
      this.appBar});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomDeliveryAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(title is String ? kToolbarHeight * 2 : kToolbarHeight);
}

class _CustomDeliveryAppBarState extends ConsumerState<CustomDeliveryAppBar> {
  @override
  void initState() {
    ref.read(currentDeliverNotifierProvider.notifier).getCurrentLivreur(
            FilterOptional.fromJson({
          "key": "user",
          "value": SharedPref.getEmail(),
          "type": "EQUAL",
          "applyAnd": true
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final livreur = ref.watch(currentDeliverNotifierProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            "assets/images/splash.png",
            height: 32,
          ),
          const Spacer()
        ],
      ),
      actions: [
        InkWell(
          onTap: () {
            widget.scaffoldKey?.currentState?.openDrawer();
          },
          child: Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 24, left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: livreur.hasValue && livreur.value?.url is String
                  ? CachedNetworkImage(
                      imageUrl: livreur.value?.url ??
                          "http://via.placeholder.com/350x150",
                      fit: BoxFit.cover,
                      color: Colors.grey,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : livreur.value?.url is! String
                      ? CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade300,
                          child: const Icon(Icons.person),
                        )
                      : const CircularProgressIndicator(),
            ),
          ),
        )
      ],
      bottom: widget.appBar is AppBar
          ? widget.appBar
          : widget.title is String
              ? AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leadingWidth: 70,
                  leading: widget.leading is Widget
                      ? widget.leading
                      : widget.canPop
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: context.popRoute,
                                  icon: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.greyBackground,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/back.svg',
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : null,
                  title: Text(widget.title!),
                  actions: [if (widget.action is Widget) widget.action!],
                )
              : null,
    );
  }
}
