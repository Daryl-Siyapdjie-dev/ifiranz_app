// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddTypeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddTypeScreen(),
      );
    },
    AdditionalInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdditionalInfoScreen(),
      );
    },
    CartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    ClientDeliveryLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ClientDeliveryLayoutScreen(),
      );
    },
    ClientDeliveryOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ClientDeliveryOrderDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClientDeliveryOrderDetailScreen(
          key: args.key,
          data: args.data,
          isPendingDeliveries: args.isPendingDeliveries,
        ),
      );
    },
    ClientDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<ClientDeliveryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClientDeliveryScreen(
          key: args.key,
          data: args.data,
          isMerchant: args.isMerchant,
        ),
      );
    },
    ClientOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ClientOrderDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ClientOrderDetailScreen(
          data: args.data,
          isMarchant: args.isMarchant,
          key: args.key,
        ),
      );
    },
    CreateMerchandAddRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateMerchandAddScreen(),
      );
    },
    CreateNewProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateNewProductScreen(),
      );
    },
    DashboardBonusRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardBonusScreen(),
      );
    },
    DashboardDeliveryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardDeliveryScreen(),
      );
    },
    DashboardDeliveryTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardDeliveryTabScreen(),
      );
    },
    DashboardInventoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardInventoryScreen(),
      );
    },
    DashboardOrdersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardOrdersScreen(),
      );
    },
    DeliveryDeliveryRoute.name: (routeData) {
      final args = routeData.argsAs<DeliveryDeliveryRouteArgs>(
          orElse: () => const DeliveryDeliveryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DeliveryDeliveryScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
    DeliveryLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeliveryLayoutScreen(),
      );
    },
    DeliveryOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DeliveryOrderDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DeliveryOrderDetailScreen(
          key: args.key,
          isOnlyDetail: args.isOnlyDetail,
          data: args.data,
        ),
      );
    },
    EditMerchandRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditMerchandScreen(),
      );
    },
    FoodDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FoodDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FoodDetailsScreen(
          key: args.key,
          item: args.item,
        ),
      );
    },
    FoodRestaurantRoute.name: (routeData) {
      final args = routeData.argsAs<FoodRestaurantRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FoodRestaurantScreen(
          key: args.key,
          marchant: args.marchant,
        ),
      );
    },
    ForgotOTPRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotOTPRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ForgotOTPScreen(
          isPhoneNumber: args.isPhoneNumber,
          token: args.token,
          verifier: args.verifier,
          key: args.key,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordScreen(),
      );
    },
    HomeDeliveryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeDeliveryScreen(),
      );
    },
    HomeDeliveryTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeDeliveryTabScreen(),
      );
    },
    HomeMerchantRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeMerchantScreen(),
      );
    },
    HomeMerchantTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeMerchantTabScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeTabScreen(),
      );
    },
    LanguageSelectorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LanguageSelectorScreen(),
      );
    },
    LivreurMapRoute.name: (routeData) {
      final args = routeData.argsAs<LivreurMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LivreurMapScreen(
          record: args.record,
          key: args.key,
        ),
      );
    },
    LocationPickerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationPickerScreen(),
      );
    },
    MainAppLivreurRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainAppLivreurScreen(),
      );
    },
    MainAppMarchandRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainAppMarchandScreen(),
      );
    },
    MainAppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainAppScreen(),
      );
    },
    ManageTypesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ManageTypesScreen(),
      );
    },
    MarchandClientMapRoute.name: (routeData) {
      final args = routeData.argsAs<MarchandClientMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MarchandClientMapScreen(
          commande: args.commande,
          key: args.key,
        ),
      );
    },
    MerchandClientRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MerchandClientScreen(),
      );
    },
    MerchandDashboardDashboardDeliveryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MerchandDashboardDashboardDeliveryScreen(),
      );
    },
    MerchandDashboardTransactionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MerchandDashboardTransactionScreen(),
      );
    },
    MerchandInventoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MerchandInventoryDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MerchandInventoryDetailsScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
    MerchandInventoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MerchandInventoryScreen(),
      );
    },
    MerchandOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MerchandOrderDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MerchandOrderDetailScreen(
          data: args.data,
          key: args.key,
        ),
      );
    },
    MerchandOrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MerchandOrderDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MerchandOrderDetailsScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
    MerchandProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MerchandProductDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MerchandProductDetailScreen(
          key: args.key,
          item: args.item,
        ),
      );
    },
    MerchantOrderLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MerchantOrderLayoutScreen(),
      );
    },
    MerchantOrdersTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MerchantOrdersTabScreen(),
      );
    },
    MerchantPerTypeRoute.name: (routeData) {
      final args = routeData.argsAs<MerchantPerTypeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MerchantPerTypeScreen(
          key: args.key,
          merchants: args.merchants,
        ),
      );
    },
    MerchantProductRoute.name: (routeData) {
      final args = routeData.argsAs<MerchantProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MerchantProductScreen(
          key: args.key,
          infra: args.infra,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    OrderClientDeliveriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderClientDeliveriesScreen(),
      );
    },
    OrderDeliveryTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderDeliveryTabScreen(),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailsScreen(
          paymentIOPtionInfo: args.paymentIOPtionInfo,
          key: args.key,
        ),
      );
    },
    OrderLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderLayoutScreen(),
      );
    },
    OrderTabRoute.name: (routeData) {
      final args = routeData.argsAs<OrderTabRouteArgs>(
          orElse: () => const OrderTabRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderTabScreen(
          key: args.key,
          operatorInfo: args.operatorInfo,
        ),
      );
    },
    PaymentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaymentScreen(),
      );
    },
    PendingDeliveriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PendingDeliveriesScreen(),
      );
    },
    PickUpOtpRoute.name: (routeData) {
      final args = routeData.argsAs<PickUpOtpRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PickUpOtpScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
    ProductLayoutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductLayoutScreen(),
      );
    },
    ProductsTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductsTabScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    RegisterAdditionalInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterAdditionalInfoScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    ReportBugRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportBugScreen(),
      );
    },
    ResearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResearchScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetPasswordScreen(
          request: args.request,
          isPhoneNumber: args.isPhoneNumber,
          key: args.key,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TestClientMapRoute.name: (routeData) {
      final args = routeData.argsAs<TestClientMapRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TestClientMapScreen(
          record: args.record,
          handleUpadteStatus: args.handleUpadteStatus,
          key: args.key,
        ),
      );
    },
    UpdateProductRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateProductScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
  };
}

/// generated route for
/// [AddTypeScreen]
class AddTypeRoute extends PageRouteInfo<void> {
  const AddTypeRoute({List<PageRouteInfo>? children})
      : super(
          AddTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTypeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdditionalInfoScreen]
class AdditionalInfoRoute extends PageRouteInfo<void> {
  const AdditionalInfoRoute({List<PageRouteInfo>? children})
      : super(
          AdditionalInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdditionalInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute({List<PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ClientDeliveryLayoutScreen]
class ClientDeliveryLayoutRoute extends PageRouteInfo<void> {
  const ClientDeliveryLayoutRoute({List<PageRouteInfo>? children})
      : super(
          ClientDeliveryLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClientDeliveryLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ClientDeliveryOrderDetailScreen]
class ClientDeliveryOrderDetailRoute
    extends PageRouteInfo<ClientDeliveryOrderDetailRouteArgs> {
  ClientDeliveryOrderDetailRoute({
    Key? key,
    required Records data,
    bool isPendingDeliveries = false,
    List<PageRouteInfo>? children,
  }) : super(
          ClientDeliveryOrderDetailRoute.name,
          args: ClientDeliveryOrderDetailRouteArgs(
            key: key,
            data: data,
            isPendingDeliveries: isPendingDeliveries,
          ),
          initialChildren: children,
        );

  static const String name = 'ClientDeliveryOrderDetailRoute';

  static const PageInfo<ClientDeliveryOrderDetailRouteArgs> page =
      PageInfo<ClientDeliveryOrderDetailRouteArgs>(name);
}

class ClientDeliveryOrderDetailRouteArgs {
  const ClientDeliveryOrderDetailRouteArgs({
    this.key,
    required this.data,
    this.isPendingDeliveries = false,
  });

  final Key? key;

  final Records data;

  final bool isPendingDeliveries;

  @override
  String toString() {
    return 'ClientDeliveryOrderDetailRouteArgs{key: $key, data: $data, isPendingDeliveries: $isPendingDeliveries}';
  }
}

/// generated route for
/// [ClientDeliveryScreen]
class ClientDeliveryRoute extends PageRouteInfo<ClientDeliveryRouteArgs> {
  ClientDeliveryRoute({
    Key? key,
    required Records data,
    bool isMerchant = false,
    List<PageRouteInfo>? children,
  }) : super(
          ClientDeliveryRoute.name,
          args: ClientDeliveryRouteArgs(
            key: key,
            data: data,
            isMerchant: isMerchant,
          ),
          initialChildren: children,
        );

  static const String name = 'ClientDeliveryRoute';

  static const PageInfo<ClientDeliveryRouteArgs> page =
      PageInfo<ClientDeliveryRouteArgs>(name);
}

class ClientDeliveryRouteArgs {
  const ClientDeliveryRouteArgs({
    this.key,
    required this.data,
    this.isMerchant = false,
  });

  final Key? key;

  final Records data;

  final bool isMerchant;

  @override
  String toString() {
    return 'ClientDeliveryRouteArgs{key: $key, data: $data, isMerchant: $isMerchant}';
  }
}

/// generated route for
/// [ClientOrderDetailScreen]
class ClientOrderDetailRoute extends PageRouteInfo<ClientOrderDetailRouteArgs> {
  ClientOrderDetailRoute({
    required CurrentCartResponse data,
    bool isMarchant = false,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ClientOrderDetailRoute.name,
          args: ClientOrderDetailRouteArgs(
            data: data,
            isMarchant: isMarchant,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ClientOrderDetailRoute';

  static const PageInfo<ClientOrderDetailRouteArgs> page =
      PageInfo<ClientOrderDetailRouteArgs>(name);
}

class ClientOrderDetailRouteArgs {
  const ClientOrderDetailRouteArgs({
    required this.data,
    this.isMarchant = false,
    this.key,
  });

  final CurrentCartResponse data;

  final bool isMarchant;

  final Key? key;

  @override
  String toString() {
    return 'ClientOrderDetailRouteArgs{data: $data, isMarchant: $isMarchant, key: $key}';
  }
}

/// generated route for
/// [CreateMerchandAddScreen]
class CreateMerchandAddRoute extends PageRouteInfo<void> {
  const CreateMerchandAddRoute({List<PageRouteInfo>? children})
      : super(
          CreateMerchandAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateMerchandAddRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateNewProductScreen]
class CreateNewProductRoute extends PageRouteInfo<void> {
  const CreateNewProductRoute({List<PageRouteInfo>? children})
      : super(
          CreateNewProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateNewProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardBonusScreen]
class DashboardBonusRoute extends PageRouteInfo<void> {
  const DashboardBonusRoute({List<PageRouteInfo>? children})
      : super(
          DashboardBonusRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardBonusRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardDeliveryScreen]
class DashboardDeliveryRoute extends PageRouteInfo<void> {
  const DashboardDeliveryRoute({List<PageRouteInfo>? children})
      : super(
          DashboardDeliveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardDeliveryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardDeliveryTabScreen]
class DashboardDeliveryTabRoute extends PageRouteInfo<void> {
  const DashboardDeliveryTabRoute({List<PageRouteInfo>? children})
      : super(
          DashboardDeliveryTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardDeliveryTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardInventoryScreen]
class DashboardInventoryRoute extends PageRouteInfo<void> {
  const DashboardInventoryRoute({List<PageRouteInfo>? children})
      : super(
          DashboardInventoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardInventoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardOrdersScreen]
class DashboardOrdersRoute extends PageRouteInfo<void> {
  const DashboardOrdersRoute({List<PageRouteInfo>? children})
      : super(
          DashboardOrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardOrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeliveryDeliveryScreen]
class DeliveryDeliveryRoute extends PageRouteInfo<DeliveryDeliveryRouteArgs> {
  DeliveryDeliveryRoute({
    Key? key,
    Records? data,
    List<PageRouteInfo>? children,
  }) : super(
          DeliveryDeliveryRoute.name,
          args: DeliveryDeliveryRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliveryDeliveryRoute';

  static const PageInfo<DeliveryDeliveryRouteArgs> page =
      PageInfo<DeliveryDeliveryRouteArgs>(name);
}

class DeliveryDeliveryRouteArgs {
  const DeliveryDeliveryRouteArgs({
    this.key,
    this.data,
  });

  final Key? key;

  final Records? data;

  @override
  String toString() {
    return 'DeliveryDeliveryRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [DeliveryLayoutScreen]
class DeliveryLayoutRoute extends PageRouteInfo<void> {
  const DeliveryLayoutRoute({List<PageRouteInfo>? children})
      : super(
          DeliveryLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeliveryOrderDetailScreen]
class DeliveryOrderDetailRoute
    extends PageRouteInfo<DeliveryOrderDetailRouteArgs> {
  DeliveryOrderDetailRoute({
    Key? key,
    bool isOnlyDetail = false,
    required Records data,
    List<PageRouteInfo>? children,
  }) : super(
          DeliveryOrderDetailRoute.name,
          args: DeliveryOrderDetailRouteArgs(
            key: key,
            isOnlyDetail: isOnlyDetail,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'DeliveryOrderDetailRoute';

  static const PageInfo<DeliveryOrderDetailRouteArgs> page =
      PageInfo<DeliveryOrderDetailRouteArgs>(name);
}

class DeliveryOrderDetailRouteArgs {
  const DeliveryOrderDetailRouteArgs({
    this.key,
    this.isOnlyDetail = false,
    required this.data,
  });

  final Key? key;

  final bool isOnlyDetail;

  final Records data;

  @override
  String toString() {
    return 'DeliveryOrderDetailRouteArgs{key: $key, isOnlyDetail: $isOnlyDetail, data: $data}';
  }
}

/// generated route for
/// [EditMerchandScreen]
class EditMerchandRoute extends PageRouteInfo<void> {
  const EditMerchandRoute({List<PageRouteInfo>? children})
      : super(
          EditMerchandRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditMerchandRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoodDetailsScreen]
class FoodDetailsRoute extends PageRouteInfo<FoodDetailsRouteArgs> {
  FoodDetailsRoute({
    Key? key,
    required ProductModel item,
    List<PageRouteInfo>? children,
  }) : super(
          FoodDetailsRoute.name,
          args: FoodDetailsRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'FoodDetailsRoute';

  static const PageInfo<FoodDetailsRouteArgs> page =
      PageInfo<FoodDetailsRouteArgs>(name);
}

class FoodDetailsRouteArgs {
  const FoodDetailsRouteArgs({
    this.key,
    required this.item,
  });

  final Key? key;

  final ProductModel item;

  @override
  String toString() {
    return 'FoodDetailsRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [FoodRestaurantScreen]
class FoodRestaurantRoute extends PageRouteInfo<FoodRestaurantRouteArgs> {
  FoodRestaurantRoute({
    Key? key,
    required Merchant marchant,
    List<PageRouteInfo>? children,
  }) : super(
          FoodRestaurantRoute.name,
          args: FoodRestaurantRouteArgs(
            key: key,
            marchant: marchant,
          ),
          initialChildren: children,
        );

  static const String name = 'FoodRestaurantRoute';

  static const PageInfo<FoodRestaurantRouteArgs> page =
      PageInfo<FoodRestaurantRouteArgs>(name);
}

class FoodRestaurantRouteArgs {
  const FoodRestaurantRouteArgs({
    this.key,
    required this.marchant,
  });

  final Key? key;

  final Merchant marchant;

  @override
  String toString() {
    return 'FoodRestaurantRouteArgs{key: $key, marchant: $marchant}';
  }
}

/// generated route for
/// [ForgotOTPScreen]
class ForgotOTPRoute extends PageRouteInfo<ForgotOTPRouteArgs> {
  ForgotOTPRoute({
    bool isPhoneNumber = true,
    required String token,
    required String verifier,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ForgotOTPRoute.name,
          args: ForgotOTPRouteArgs(
            isPhoneNumber: isPhoneNumber,
            token: token,
            verifier: verifier,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotOTPRoute';

  static const PageInfo<ForgotOTPRouteArgs> page =
      PageInfo<ForgotOTPRouteArgs>(name);
}

class ForgotOTPRouteArgs {
  const ForgotOTPRouteArgs({
    this.isPhoneNumber = true,
    required this.token,
    required this.verifier,
    this.key,
  });

  final bool isPhoneNumber;

  final String token;

  final String verifier;

  final Key? key;

  @override
  String toString() {
    return 'ForgotOTPRouteArgs{isPhoneNumber: $isPhoneNumber, token: $token, verifier: $verifier, key: $key}';
  }
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeDeliveryScreen]
class HomeDeliveryRoute extends PageRouteInfo<void> {
  const HomeDeliveryRoute({List<PageRouteInfo>? children})
      : super(
          HomeDeliveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDeliveryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeDeliveryTabScreen]
class HomeDeliveryTabRoute extends PageRouteInfo<void> {
  const HomeDeliveryTabRoute({List<PageRouteInfo>? children})
      : super(
          HomeDeliveryTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeDeliveryTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeMerchantScreen]
class HomeMerchantRoute extends PageRouteInfo<void> {
  const HomeMerchantRoute({List<PageRouteInfo>? children})
      : super(
          HomeMerchantRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMerchantRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeMerchantTabScreen]
class HomeMerchantTabRoute extends PageRouteInfo<void> {
  const HomeMerchantTabRoute({List<PageRouteInfo>? children})
      : super(
          HomeMerchantTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMerchantTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeTabScreen]
class HomeTabRoute extends PageRouteInfo<void> {
  const HomeTabRoute({List<PageRouteInfo>? children})
      : super(
          HomeTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LanguageSelectorScreen]
class LanguageSelectorRoute extends PageRouteInfo<void> {
  const LanguageSelectorRoute({List<PageRouteInfo>? children})
      : super(
          LanguageSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSelectorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LivreurMapScreen]
class LivreurMapRoute extends PageRouteInfo<LivreurMapRouteArgs> {
  LivreurMapRoute({
    required Records record,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LivreurMapRoute.name,
          args: LivreurMapRouteArgs(
            record: record,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LivreurMapRoute';

  static const PageInfo<LivreurMapRouteArgs> page =
      PageInfo<LivreurMapRouteArgs>(name);
}

class LivreurMapRouteArgs {
  const LivreurMapRouteArgs({
    required this.record,
    this.key,
  });

  final Records record;

  final Key? key;

  @override
  String toString() {
    return 'LivreurMapRouteArgs{record: $record, key: $key}';
  }
}

/// generated route for
/// [LocationPickerScreen]
class LocationPickerRoute extends PageRouteInfo<void> {
  const LocationPickerRoute({List<PageRouteInfo>? children})
      : super(
          LocationPickerRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationPickerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainAppLivreurScreen]
class MainAppLivreurRoute extends PageRouteInfo<void> {
  const MainAppLivreurRoute({List<PageRouteInfo>? children})
      : super(
          MainAppLivreurRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainAppLivreurRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainAppMarchandScreen]
class MainAppMarchandRoute extends PageRouteInfo<void> {
  const MainAppMarchandRoute({List<PageRouteInfo>? children})
      : super(
          MainAppMarchandRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainAppMarchandRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainAppScreen]
class MainAppRoute extends PageRouteInfo<void> {
  const MainAppRoute({List<PageRouteInfo>? children})
      : super(
          MainAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainAppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ManageTypesScreen]
class ManageTypesRoute extends PageRouteInfo<void> {
  const ManageTypesRoute({List<PageRouteInfo>? children})
      : super(
          ManageTypesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManageTypesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MarchandClientMapScreen]
class MarchandClientMapRoute extends PageRouteInfo<MarchandClientMapRouteArgs> {
  MarchandClientMapRoute({
    required Records commande,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MarchandClientMapRoute.name,
          args: MarchandClientMapRouteArgs(
            commande: commande,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MarchandClientMapRoute';

  static const PageInfo<MarchandClientMapRouteArgs> page =
      PageInfo<MarchandClientMapRouteArgs>(name);
}

class MarchandClientMapRouteArgs {
  const MarchandClientMapRouteArgs({
    required this.commande,
    this.key,
  });

  final Records commande;

  final Key? key;

  @override
  String toString() {
    return 'MarchandClientMapRouteArgs{commande: $commande, key: $key}';
  }
}

/// generated route for
/// [MerchandClientScreen]
class MerchandClientRoute extends PageRouteInfo<void> {
  const MerchandClientRoute({List<PageRouteInfo>? children})
      : super(
          MerchandClientRoute.name,
          initialChildren: children,
        );

  static const String name = 'MerchandClientRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MerchandDashboardDashboardDeliveryScreen]
class MerchandDashboardDashboardDeliveryRoute extends PageRouteInfo<void> {
  const MerchandDashboardDashboardDeliveryRoute({List<PageRouteInfo>? children})
      : super(
          MerchandDashboardDashboardDeliveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'MerchandDashboardDashboardDeliveryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MerchandDashboardTransactionScreen]
class MerchandDashboardTransactionRoute extends PageRouteInfo<void> {
  const MerchandDashboardTransactionRoute({List<PageRouteInfo>? children})
      : super(
          MerchandDashboardTransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MerchandDashboardTransactionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MerchandInventoryDetailsScreen]
class MerchandInventoryDetailsRoute
    extends PageRouteInfo<MerchandInventoryDetailsRouteArgs> {
  MerchandInventoryDetailsRoute({
    Key? key,
    required Inventory data,
    List<PageRouteInfo>? children,
  }) : super(
          MerchandInventoryDetailsRoute.name,
          args: MerchandInventoryDetailsRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'MerchandInventoryDetailsRoute';

  static const PageInfo<MerchandInventoryDetailsRouteArgs> page =
      PageInfo<MerchandInventoryDetailsRouteArgs>(name);
}

class MerchandInventoryDetailsRouteArgs {
  const MerchandInventoryDetailsRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final Inventory data;

  @override
  String toString() {
    return 'MerchandInventoryDetailsRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [MerchandInventoryScreen]
class MerchandInventoryRoute extends PageRouteInfo<void> {
  const MerchandInventoryRoute({List<PageRouteInfo>? children})
      : super(
          MerchandInventoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'MerchandInventoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MerchandOrderDetailScreen]
class MerchandOrderDetailRoute
    extends PageRouteInfo<MerchandOrderDetailRouteArgs> {
  MerchandOrderDetailRoute({
    required CurrentCartResponse data,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MerchandOrderDetailRoute.name,
          args: MerchandOrderDetailRouteArgs(
            data: data,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MerchandOrderDetailRoute';

  static const PageInfo<MerchandOrderDetailRouteArgs> page =
      PageInfo<MerchandOrderDetailRouteArgs>(name);
}

class MerchandOrderDetailRouteArgs {
  const MerchandOrderDetailRouteArgs({
    required this.data,
    this.key,
  });

  final CurrentCartResponse data;

  final Key? key;

  @override
  String toString() {
    return 'MerchandOrderDetailRouteArgs{data: $data, key: $key}';
  }
}

/// generated route for
/// [MerchandOrderDetailsScreen]
class MerchandOrderDetailsRoute
    extends PageRouteInfo<MerchandOrderDetailsRouteArgs> {
  MerchandOrderDetailsRoute({
    Key? key,
    required Records data,
    List<PageRouteInfo>? children,
  }) : super(
          MerchandOrderDetailsRoute.name,
          args: MerchandOrderDetailsRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'MerchandOrderDetailsRoute';

  static const PageInfo<MerchandOrderDetailsRouteArgs> page =
      PageInfo<MerchandOrderDetailsRouteArgs>(name);
}

class MerchandOrderDetailsRouteArgs {
  const MerchandOrderDetailsRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final Records data;

  @override
  String toString() {
    return 'MerchandOrderDetailsRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [MerchandProductDetailScreen]
class MerchandProductDetailRoute
    extends PageRouteInfo<MerchandProductDetailRouteArgs> {
  MerchandProductDetailRoute({
    Key? key,
    required ProductModel item,
    List<PageRouteInfo>? children,
  }) : super(
          MerchandProductDetailRoute.name,
          args: MerchandProductDetailRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'MerchandProductDetailRoute';

  static const PageInfo<MerchandProductDetailRouteArgs> page =
      PageInfo<MerchandProductDetailRouteArgs>(name);
}

class MerchandProductDetailRouteArgs {
  const MerchandProductDetailRouteArgs({
    this.key,
    required this.item,
  });

  final Key? key;

  final ProductModel item;

  @override
  String toString() {
    return 'MerchandProductDetailRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [MerchantOrderLayoutScreen]
class MerchantOrderLayoutRoute extends PageRouteInfo<void> {
  const MerchantOrderLayoutRoute({List<PageRouteInfo>? children})
      : super(
          MerchantOrderLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'MerchantOrderLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MerchantOrdersTabScreen]
class MerchantOrdersTabRoute extends PageRouteInfo<void> {
  const MerchantOrdersTabRoute({List<PageRouteInfo>? children})
      : super(
          MerchantOrdersTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'MerchantOrdersTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MerchantPerTypeScreen]
class MerchantPerTypeRoute extends PageRouteInfo<MerchantPerTypeRouteArgs> {
  MerchantPerTypeRoute({
    Key? key,
    required List<InfrastructurModel> merchants,
    List<PageRouteInfo>? children,
  }) : super(
          MerchantPerTypeRoute.name,
          args: MerchantPerTypeRouteArgs(
            key: key,
            merchants: merchants,
          ),
          initialChildren: children,
        );

  static const String name = 'MerchantPerTypeRoute';

  static const PageInfo<MerchantPerTypeRouteArgs> page =
      PageInfo<MerchantPerTypeRouteArgs>(name);
}

class MerchantPerTypeRouteArgs {
  const MerchantPerTypeRouteArgs({
    this.key,
    required this.merchants,
  });

  final Key? key;

  final List<InfrastructurModel> merchants;

  @override
  String toString() {
    return 'MerchantPerTypeRouteArgs{key: $key, merchants: $merchants}';
  }
}

/// generated route for
/// [MerchantProductScreen]
class MerchantProductRoute extends PageRouteInfo<MerchantProductRouteArgs> {
  MerchantProductRoute({
    Key? key,
    required InfrastructurModel infra,
    List<PageRouteInfo>? children,
  }) : super(
          MerchantProductRoute.name,
          args: MerchantProductRouteArgs(
            key: key,
            infra: infra,
          ),
          initialChildren: children,
        );

  static const String name = 'MerchantProductRoute';

  static const PageInfo<MerchantProductRouteArgs> page =
      PageInfo<MerchantProductRouteArgs>(name);
}

class MerchantProductRouteArgs {
  const MerchantProductRouteArgs({
    this.key,
    required this.infra,
  });

  final Key? key;

  final InfrastructurModel infra;

  @override
  String toString() {
    return 'MerchantProductRouteArgs{key: $key, infra: $infra}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderClientDeliveriesScreen]
class OrderClientDeliveriesRoute extends PageRouteInfo<void> {
  const OrderClientDeliveriesRoute({List<PageRouteInfo>? children})
      : super(
          OrderClientDeliveriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderClientDeliveriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderDeliveryTabScreen]
class OrderDeliveryTabRoute extends PageRouteInfo<void> {
  const OrderDeliveryTabRoute({List<PageRouteInfo>? children})
      : super(
          OrderDeliveryTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderDeliveryTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderDetailsScreen]
class OrderDetailsRoute extends PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    required CashoutModel paymentIOPtionInfo,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            paymentIOPtionInfo: paymentIOPtionInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const PageInfo<OrderDetailsRouteArgs> page =
      PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    required this.paymentIOPtionInfo,
    this.key,
  });

  final CashoutModel paymentIOPtionInfo;

  final Key? key;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{paymentIOPtionInfo: $paymentIOPtionInfo, key: $key}';
  }
}

/// generated route for
/// [OrderLayoutScreen]
class OrderLayoutRoute extends PageRouteInfo<void> {
  const OrderLayoutRoute({List<PageRouteInfo>? children})
      : super(
          OrderLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderTabScreen]
class OrderTabRoute extends PageRouteInfo<OrderTabRouteArgs> {
  OrderTabRoute({
    Key? key,
    CashoutModel? operatorInfo,
    List<PageRouteInfo>? children,
  }) : super(
          OrderTabRoute.name,
          args: OrderTabRouteArgs(
            key: key,
            operatorInfo: operatorInfo,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderTabRoute';

  static const PageInfo<OrderTabRouteArgs> page =
      PageInfo<OrderTabRouteArgs>(name);
}

class OrderTabRouteArgs {
  const OrderTabRouteArgs({
    this.key,
    this.operatorInfo,
  });

  final Key? key;

  final CashoutModel? operatorInfo;

  @override
  String toString() {
    return 'OrderTabRouteArgs{key: $key, operatorInfo: $operatorInfo}';
  }
}

/// generated route for
/// [PaymentScreen]
class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute({List<PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PendingDeliveriesScreen]
class PendingDeliveriesRoute extends PageRouteInfo<void> {
  const PendingDeliveriesRoute({List<PageRouteInfo>? children})
      : super(
          PendingDeliveriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingDeliveriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PickUpOtpScreen]
class PickUpOtpRoute extends PageRouteInfo<PickUpOtpRouteArgs> {
  PickUpOtpRoute({
    Key? key,
    required Records data,
    List<PageRouteInfo>? children,
  }) : super(
          PickUpOtpRoute.name,
          args: PickUpOtpRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'PickUpOtpRoute';

  static const PageInfo<PickUpOtpRouteArgs> page =
      PageInfo<PickUpOtpRouteArgs>(name);
}

class PickUpOtpRouteArgs {
  const PickUpOtpRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final Records data;

  @override
  String toString() {
    return 'PickUpOtpRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [ProductLayoutScreen]
class ProductLayoutRoute extends PageRouteInfo<void> {
  const ProductLayoutRoute({List<PageRouteInfo>? children})
      : super(
          ProductLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductLayoutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductsTabScreen]
class ProductsTabRoute extends PageRouteInfo<void> {
  const ProductsTabRoute({List<PageRouteInfo>? children})
      : super(
          ProductsTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterAdditionalInfoScreen]
class RegisterAdditionalInfoRoute extends PageRouteInfo<void> {
  const RegisterAdditionalInfoRoute({List<PageRouteInfo>? children})
      : super(
          RegisterAdditionalInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterAdditionalInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportBugScreen]
class ReportBugRoute extends PageRouteInfo<void> {
  const ReportBugRoute({List<PageRouteInfo>? children})
      : super(
          ReportBugRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportBugRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResearchScreen]
class ResearchRoute extends PageRouteInfo<void> {
  const ResearchRoute({List<PageRouteInfo>? children})
      : super(
          ResearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPasswordScreen]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required ResetPasswordRequest request,
    required bool isPhoneNumber,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            request: request,
            isPhoneNumber: isPhoneNumber,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<ResetPasswordRouteArgs> page =
      PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    required this.request,
    required this.isPhoneNumber,
    this.key,
  });

  final ResetPasswordRequest request;

  final bool isPhoneNumber;

  final Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{request: $request, isPhoneNumber: $isPhoneNumber, key: $key}';
  }
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TestClientMapScreen]
class TestClientMapRoute extends PageRouteInfo<TestClientMapRouteArgs> {
  TestClientMapRoute({
    required Records record,
    required Function handleUpadteStatus,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TestClientMapRoute.name,
          args: TestClientMapRouteArgs(
            record: record,
            handleUpadteStatus: handleUpadteStatus,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TestClientMapRoute';

  static const PageInfo<TestClientMapRouteArgs> page =
      PageInfo<TestClientMapRouteArgs>(name);
}

class TestClientMapRouteArgs {
  const TestClientMapRouteArgs({
    required this.record,
    required this.handleUpadteStatus,
    this.key,
  });

  final Records record;

  final Function handleUpadteStatus;

  final Key? key;

  @override
  String toString() {
    return 'TestClientMapRouteArgs{record: $record, handleUpadteStatus: $handleUpadteStatus, key: $key}';
  }
}

/// generated route for
/// [UpdateProductScreen]
class UpdateProductRoute extends PageRouteInfo<UpdateProductRouteArgs> {
  UpdateProductRoute({
    Key? key,
    required ProductModel data,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateProductRoute.name,
          args: UpdateProductRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateProductRoute';

  static const PageInfo<UpdateProductRouteArgs> page =
      PageInfo<UpdateProductRouteArgs>(name);
}

class UpdateProductRouteArgs {
  const UpdateProductRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final ProductModel data;

  @override
  String toString() {
    return 'UpdateProductRouteArgs{key: $key, data: $data}';
  }
}
