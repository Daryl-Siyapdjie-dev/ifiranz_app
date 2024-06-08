import 'package:auto_route/auto_route.dart';
import 'package:ifiranz_client/src/features/auth/core/domain/client_request.dart';
import 'package:ifiranz_client/src/features/auth/core/shared/provider.dart';
import 'package:ifiranz_client/src/features/auth/sign_in/shared/providers.dart';
import 'package:ifiranz_client/src/features/client/home/domain/filter_optional.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/services/local/shared_pref.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/common_import.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/find_authority_role.dart';
import 'package:ifiranz_client/src/router/app_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../core/infrastructure/extensions/media_query_extension.dart';
import '../core/infrastructure/extensions/theme_extension.dart';
import '../core/presentation/themes/app_colors.dart';

@RoutePage()
class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        Future.delayed(const Duration(milliseconds: 300), () {
          ref.read(userLocalCredentialsRepository).getUserLocalCredentials.then((value) {
            if (value is String && JwtDecoder.isExpired(value)) {
              ref.read(userLocalCredentialsRepository).deleteUserLocalCredentials();
              context.replaceRoute(const SignInRoute());
            } else if (value is String && !JwtDecoder.isExpired(value)) {
              if (SharedPref.getHasEndAccountCreationPhone() is String) {
                context.replaceRoute(const RegisterAdditionalInfoRoute());
                return;
              }

              Map<String, dynamic> decodedToken = JwtDecoder.decode(value);
              SharedPref.setEmail(decodedToken['sub']);
              context.popRoute();

              if (findAuthorityRole((decodedToken['authorities'] as List).map((e) => Map<String, dynamic>.from(e)).toList()) == Authories.merchant) {
                ref
                    .read(currentMarchandNotifierProvider.notifier)
                    .getCurrentMarchand((FilterOptional.fromJson({"key": "user", "value": decodedToken['sub'], "type": "EQUAL", "applyAnd": true})));
                context.replaceRoute(const MainAppMarchandRoute());
              } else if (findAuthorityRole((decodedToken['authorities'] as List).map((e) => Map<String, dynamic>.from(e)).toList()) ==
                  Authories.delivery) {
                context.replaceRoute(const MainAppLivreurRoute());
              } else {
                // ref.read(getCurrentClientProvider.notifier).getCurrentClient(ClientRequest(value: decodedToken['sub']));

                context.replaceRoute(const MainAppRoute());
              }
            } else {
              context.replaceRoute(const OnboardingRoute());
            }
          });
        });
      } catch (e) {
        context.replaceRoute(const OnboardingRoute());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset('assets/images/splash.png'),
          ),
          const Spacer(),
          Text(
            'Kimia technologies ${DateTime.now().year}.  All right reserved',
            textAlign: TextAlign.center,
            style: context.theme.textTheme.bodyMedium!.copyWith(
              color: AppColors.greyDark,
            ),
          ),
          SizedBox(height: context.proportionnalHeight(100)),
        ],
      ),
    );
  }
}
