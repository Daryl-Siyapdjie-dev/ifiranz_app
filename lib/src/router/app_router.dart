import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ifiranz_client/src/features/auth/additional_info/presentation/additional_option_screen.dart';
import 'package:ifiranz_client/src/features/auth/register/presentation/register_additional_info_screen.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/domain/reset_password_request.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/presentation/forgot_otp_screen.dart';
import 'package:ifiranz_client/src/features/auth/reset_password/presentation/forgot_password_screen.dart';
import 'package:ifiranz_client/src/features/client/delivery/presentation/client_delivery_layout_screen.dart';
import 'package:ifiranz_client/src/features/client/delivery/presentation/client_delivery_screen.dart';
import 'package:ifiranz_client/src/features/client/delivery/presentation/order_delivery_details_screen.dart';
import 'package:ifiranz_client/src/features/client/delivery/presentation/pending_deliverie_screen.dart';
import 'package:ifiranz_client/src/features/client/delivery/presentation/widget/location_picker_screen.dart';
import 'package:ifiranz_client/src/features/client/home/domain/current_cart_response.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:ifiranz_client/src/features/client/home/domain/transaction_response.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/cart_screen.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/food_details_screen.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/food_restaurant_sub_tab.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/home_screen.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/home_tab.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/order_detail_screen.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/order_tab_screen.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/payment_screen.dart';
import 'package:ifiranz_client/src/features/client/home/presentation/research_screen.dart';
import 'package:ifiranz_client/src/features/client/orders/presentation/orders_clients_deliveries_screen.dart';
import 'package:ifiranz_client/src/features/client/payment/domain/cashout_model.dart';
import 'package:ifiranz_client/src/features/client/profile/presentation/profile_screen.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/presentation/delivery_delivery_screen.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/presentation/pickup_otp_screen.dart';
import 'package:ifiranz_client/src/features/delivery/delivery/presentation/widget/livreur_map_screen.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/dashboard/dashboard_bonus_screen.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/dashboard/dashboard_delivery_screen.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/dashboard/dashboard_delivery_tab_screen.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/dashboard/dashboard_inventory_screen.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/dashboard/dashboard_orders_screen.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/home_delivery_screen.dart';
import 'package:ifiranz_client/src/features/delivery/home/presentation/home_delivery_tab_screen.dart';
import 'package:ifiranz_client/src/features/delivery/main_app_delivery_screen.dart';
import 'package:ifiranz_client/src/features/delivery/orders/domain/delivery_models.dart';
import 'package:ifiranz_client/src/features/delivery/orders/presentation/order_delivery_details_screen.dart';
import 'package:ifiranz_client/src/features/delivery/orders/presentation/order_delivery_tab_screen.dart';
import 'package:ifiranz_client/src/features/delivery/orders/presentation/order_layout_screen.dart';
import 'package:ifiranz_client/src/features/merchant/core/presentation/edit_merchand_screen.dart';
import 'package:ifiranz_client/src/features/merchant/delivery/presentation/widget/marchand_map_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/presentation/merchand_add_client_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/clients/presentation/merchand_client_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/delivery/presentation/merchand_delivery_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/delivery/presentation/merchand_order_details_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/domain/inventory.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/presentation/merchand_inventory_details_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/inventory/presentation/merchand_inventory_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/dashboard/transactions/presentation/merchand_transactions_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/presentation/home_merchant_screen.dart';
import 'package:ifiranz_client/src/features/merchant/home/presentation/home_merchant_tab_screen.dart';
import 'package:ifiranz_client/src/features/merchant/main_app_marchand_screen.dart';
import 'package:ifiranz_client/src/features/merchant/orders/presentation/merchant_order_latout_screen.dart';
import 'package:ifiranz_client/src/features/merchant/orders/presentation/merchant_orders_details_screen.dart';
import 'package:ifiranz_client/src/features/merchant/orders/presentation/merchant_orders_tab_screen.dart';
import 'package:ifiranz_client/src/features/merchant/products/presentation/create_new_product_screen.dart';
import 'package:ifiranz_client/src/features/merchant/products/presentation/manage_types/add_type_screen.dart';
import 'package:ifiranz_client/src/features/merchant/products/presentation/manage_types/manage_type_screen.dart';
import 'package:ifiranz_client/src/features/merchant/products/presentation/merchand_product_detail_screen.dart';
import 'package:ifiranz_client/src/features/merchant/products/presentation/product_page_layout_screen.dart';
import 'package:ifiranz_client/src/features/merchant/products/presentation/products_tab_screen.dart';
import 'package:ifiranz_client/src/features/merchant/products/presentation/update_product_screen.dart';

import '../features/auth/register/presentation/register_screen.dart';
import '../features/auth/reset_password/presentation/reset_password_screen.dart';
import '../features/auth/sign_in/presentation/sign_in_screen.dart';
import '../features/client/delivery/presentation/widget/client_map_screen.dart';
import '../features/client/home/domain/infrastructur_model.dart';
import '../features/client/home/presentation/all_merchants_per_type.dart';
import '../features/client/home/presentation/merchant_products.dart';
import '../features/client/main_app_screen.dart';
import '../features/client/orders/presentation/client_orders_details_screen.dart';
import '../features/core/presentation/widgets/language_selector_screen.dart';
import '../features/core/presentation/widgets/report_bug_screen.dart';
import '../features/delivery/delivery/presentation/delivery_layout.dart';
import '../features/merchant/colis/presentation/colis_page_layout_screen.dart';
import '../features/merchant/colis/presentation/colis_tab_screen.dart';
import '../features/merchant/colis/presentation/create_new_colis_screen.dart';
import '../features/merchant/colis/presentation/merchand_colis_detail_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(page: LanguageSelectorRoute.page),
        AutoRoute(page: MerchantProductRoute.page),
        AutoRoute(page: MerchantPerTypeRoute.page),
        AutoRoute(page: FoodDetailsRoute.page),
        AutoRoute(page: TestClientMapRoute.page),
        AutoRoute(page: ReportBugRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: RegisterAdditionalInfoRoute.page),
        AutoRoute(page: LocationPickerRoute.page),
        AutoRoute(page: MainAppRoute.page, maintainState: false, children: [
          AutoRoute(page: OrderLayoutRoute.page, maintainState: false, children: [
            AutoRoute(page: ClientDeliveryOrderDetailRoute.page),
            AutoRoute(page: ClientOrderDetailRoute.page),
            AutoRoute(path: "client-cart", page: CartRoute.page),
            AutoRoute(page: OrderClientDeliveriesRoute.page, maintainState: false, initial: true)
          ]),
          AutoRoute(page: HomeRoute.page, maintainState: false, children: [
            AutoRoute(path: "client-cart", page: CartRoute.page),
            AutoRoute(path: "client-research_page", page: ResearchRoute.page),
            AutoRoute(path: "client-food_restaurant", maintainState: false, page: FoodRestaurantRoute.page),
            AutoRoute(path: "client-home_tab", maintainState: false, page: HomeTabRoute.page, initial: true),
            AutoRoute(path: "client-payment", page: PaymentRoute.page),
            AutoRoute(path: "client-order_details", page: OrderDetailsRoute.page),
            AutoRoute(path: "client-additional_info", page: AdditionalInfoRoute.page),
            AutoRoute(path: "client-ordertab", page: OrderTabRoute.page),
          ]),
          AutoRoute(path: "client-delivery", maintainState: false, page: ClientDeliveryLayoutRoute.page, children: [
            AutoRoute(page: ClientDeliveryOrderDetailRoute.page),
            AutoRoute(path: "client-cart", page: CartRoute.page),
            AutoRoute(path: "client-pending-deliveries", page: PendingDeliveriesRoute.page, maintainState: false, initial: true),
            AutoRoute(path: "client-map-deliveries", page: ClientDeliveryRoute.page),
          ]),
        ]),
        AutoRoute(page: MainAppMarchandRoute.page, maintainState: false, children: [
          AutoRoute(page: HomeMerchantRoute.page, maintainState: false, children: [
            AutoRoute(
              page: HomeMerchantTabRoute.page,
              initial: true,
              maintainState: false,
            ),
            AutoRoute(page: ClientDeliveryRoute.page),
            AutoRoute(page: MerchandOrderDetailRoute.page),
            AutoRoute(page: MerchandClientRoute.page),
            AutoRoute(page: MerchandDashboardTransactionRoute.page),
            AutoRoute(page: CreateMerchandAddRoute.page),
            AutoRoute(page: MerchandInventoryRoute.page),
            AutoRoute(page: MerchandInventoryDetailsRoute.page),
            AutoRoute(page: MerchandDashboardDashboardDeliveryRoute.page),
            AutoRoute(page: MerchandOrderDetailsRoute.page),
          ]),
          AutoRoute(page: ColisLayoutRoute.page, maintainState: false, children: [
            AutoRoute(page: CreateNewColisRoute.page),
            AutoRoute(page: MerchandColisDetailRoute.page),
            AutoRoute(
              page: ColisTabRoute.page,
              initial: true,
              maintainState: false,
            ),
          ]),
          AutoRoute(page: ProductLayoutRoute.page, maintainState: false, children: [
            AutoRoute(page: CreateNewProductRoute.page),
            AutoRoute(page: UpdateProductRoute.page),
            AutoRoute(page: MerchandProductDetailRoute.page),
            AutoRoute(page: ManageTypesRoute.page),
            AutoRoute(page: AddTypeRoute.page),
            AutoRoute(
              page: ProductsTabRoute.page,
              initial: true,
              maintainState: false,
            ),
          ]),
          AutoRoute(page: MerchantOrderLayoutRoute.page, maintainState: false, children: [
            AutoRoute(
              page: MerchantOrdersTabRoute.page,
              maintainState: false,
              initial: true,
            ),
            AutoRoute(page: MerchandOrderDetailsRoute.page),
            AutoRoute(page: ClientOrderDetailRoute.page),
          ])
        ]),
        AutoRoute(page: MainAppLivreurRoute.page, maintainState: false, children: [
          AutoRoute(path: "livreur", page: HomeDeliveryRoute.page, maintainState: false, children: [
            AutoRoute(
              path: "livreur-home",
              initial: true,
              maintainState: false,
              page: HomeDeliveryTabRoute.page,
            ),
            AutoRoute(path: 'dash-bonus', page: DashboardBonusRoute.page),
            AutoRoute(path: 'dash-inventory', page: DeliveryOrderDetailRoute.page),
            AutoRoute(path: 'dash-delivery', page: DashboardDeliveryTabRoute.page),
            AutoRoute(path: 'dash-orders', page: DashboardOrdersRoute.page),
          ]),
          AutoRoute(path: "order-layout", page: OrderLayoutRoute.page, maintainState: false, children: [
            AutoRoute(page: DeliveryOrderDetailRoute.page),
            AutoRoute(
              path: "livreur-order",
              initial: true,
              maintainState: false,
              page: OrderDeliveryTabRoute.page,
            ),
          ]),
          AutoRoute(path: "delivery-layout", maintainState: false, page: DeliveryLayoutRoute.page, children: [
            AutoRoute(initial: true, maintainState: false, path: "livreur-delivery", page: DeliveryDeliveryRoute.page),
            AutoRoute(page: PickUpOtpRoute.page),
          ]),
        ]),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: ForgotOTPRoute.page),
        AutoRoute(page: EditMerchandRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ];
}
