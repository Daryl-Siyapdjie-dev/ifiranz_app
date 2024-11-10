import '../../domain/paginated_request.dart';

class UrlBuilder {
  // static const baseIpAddress = 'http://185.193.17.106'; // Test
  //  static const port = "8085"; // Test

  static const baseIpAddress = 'https://ifiranz.com'; // Prod
  static const port = "8443"; // Prod

  static const baseUrl = '$baseIpAddress:$port';

  UrlBuilder();

  // Build search produc
  String buildSearchProduct([PaginatedRequest? request]) =>
      "$baseUrl/livraison-service/article/page?page=${request!.page}&size=${request.size}";

//auth-service
  String buildRegisterUser() => '$baseUrl/auth-service/api/v1/auth/register';

  String buildRegisterUserAdditionalInfo() =>
      '$baseUrl/livraison-service/client/add';

  String buildAddMerchantCostumer() =>
      '$baseUrl/livraison-service/merchantClient';

  String buildFindProfilByName() =>
      '$baseUrl/auth-service/api/v1/profils/costumer';

  String buildResetPasswordByEmail() =>
      '$baseUrl/auth-service/api/v1/auth/recover-password-email';

  String buildResetPasswordByPhone() =>
      '$baseUrl/auth-service/api/v1/auth/recover-password-phone';

  String buildFindByOtp(String otp) =>
      '$baseUrl/auth-service/api/v1/users/$otp/user-otp';

// Build verify Token
  String buildVerifyOTP() => '$baseUrl/auth-service/api/v1/auth/verify-token';

  String buildResetPasswordWithPhone(String phoneNumber) =>
      '$baseUrl/auth-service/api/v1/users/$phoneNumber/user-phone';

// Reset Password
  String buildResetPasswordWithEmail() =>
      '$baseUrl/auth-service/api/v1/auth/reset-password';

  String buildLoginUser() => '$baseUrl/auth-service/api/v1/auth/login';

  String buildGetListOrders(PaginatedRequest params) =>
      '$baseUrl/livraison-service/livraison/pageLivreur?page=${params.page}&size=${params.size}';

  String buildAcceptDeliveryOrder(int id) =>
      '$baseUrl/livraison-service/livraison/accepter/$id';

  String buildDenyDeliveryOrder(int id) =>
      '$baseUrl/livraison-service/livraison/refuser/$id';

  String buildSendOtpToDeliveryOrder(int id) =>
      '$baseUrl/livraison-service/livraison/sendOpt/$id';

  String buildDeliveryOrderFindByCode(String id) =>
      '$baseUrl/livraison-service/livraison/livreurFindByCode/$id';

  String buildValidateOtpToDeliveryOrder(int id, String value) =>
      '$baseUrl/livraison-service/livraison/validate/$id?code=$value';

  String buildUpdateDeliveryOrder(int id) =>
      '$baseUrl/livraison-service/livraison/update/encours/$id';

//client api methods

  String buildInfrastructur(PaginatedRequest params) =>
      '$baseUrl/livraison-service/marchand/page?page=${params.page}&size=${params.size}';

  String buildGetAllProduit(PaginatedRequest params) =>
      '$baseUrl/livraison-service/article/page?page=${params.page}&size=${params.size}';

  String buildGetMerchantProduit(PaginatedRequest params, String merchantId) =>
      '$baseUrl/livraison-service/article/merchant/$merchantId/page?page=${params.page}&size=${params.size}';

  String buildGetProduit(String code) =>
      '$baseUrl/livraison-service/article/findByCode/$code';

  String buildCreateCommande() =>
      '$baseUrl/livraison-service/commande/client/add';

  String buildMerchandCreateCommande() =>
      '$baseUrl/livraison-service/commande/merchantClient/add';

  String buildUpdateCommande() =>
      '$baseUrl/livraison-service/commande/client/edit';

  String buildMakeNotation(int idArticle, int note, String commentaire) =>
      '$baseUrl/livraison-service/note/article/$idArticle?note=$note&commentaire=$commentaire';

  String buildReportBug(String commentaire) =>
      '$baseUrl/livraison-service/retour/add?commentaire=$commentaire';

  String buildFindCommandeByCode(String code) =>
      '$baseUrl/livraison-service/commande/findByCode/$code';

  String buildFindAllQuartier() =>
      '$baseUrl/livraison-service/quartier/all?page=0&size=20';

  String buildFindProduitByDesignation() =>
      '$baseUrl/livraison-service/article/all';

  String buildGetCurentClient() => '$baseUrl/livraison-service/client/all';

  String buildFindArticleDuMarchand() =>
      '$baseUrl/livraison-service/article/all';

  String buildGetCurrentCart() =>
      '$baseUrl/livraison-service/commande/findPanier';

  String buildGetMostSellOfRestaurant() =>
      '$baseUrl/livraison-service/article/topSales';

  String buildCurrentDeliveries() =>
      '$baseUrl/livraison-service/livraison/suivre';

  String buildConsultDeliveryByCode() =>
      '$baseUrl/livraison-service/commande/findPanier';

  //Payment

  String buildGetOperator() =>
      '$baseUrl/payment-service/api/v1/payment/payment-methods';
  // String buildGetOperator(int code) =>
  //     '$baseUrl/payment-service/api/v1/payment/$code/cashout';

  String buildInitTrasact() =>
      '$baseUrl/payment-service/api/v1/payment/init-transaction';

  String buildFinalise() => '$baseUrl/payment-service/api/v1/payment/pay';

  String buildVerifyTransaction(String transactionId) =>
      '$baseUrl/payment-service/api/v1/payment/verify/$transactionId';

// Marchand

  String buildGetMerchantUser([PaginatedRequest? request]) =>
      '$baseUrl/livraison-service/marchand/all${request != null ? '?page=${request.page}&size=${request.size}' : ''}';

  String buildGetLivreurUser() => '$baseUrl/livraison-service/livreur/all';

  String buildAddMerchantCommand() =>
      '$baseUrl/livraison-service/commande/client/add';

  String buildAddMerchantColis() =>
      '$baseUrl/livraison-service/commande/merchantClient/add';

  String builMerchantCommands(PaginatedRequest request) =>
      '$baseUrl/livraison-service/commande/page?page=${request.page}&size=${request.size}';

  String builV2MerchantCommands(PaginatedRequest request) =>
      '$baseUrl/livraison-service/commande/page/marchand?page=${request.page}&size=${request.size}';

  String builMerchantAddClient() => '$baseUrl/livraison-service/client/add';

  String builSearchMerchantClient(PaginatedRequest request) =>
      '$baseUrl/livraison-service/client/page?page=${request.page}&size=${request.size}';

  String builMerchantClientList(PaginatedRequest request) =>
      '$baseUrl/livraison-service/merchantClient/page/byMerchant?page=${request.page}&size=${request.size}';

  String builMerchantAddArticle() => '$baseUrl/livraison-service/article/add';

  String builMerchantAddArticleImage(int id) =>
      '$baseUrl/livraison-service/article/fileUpload/$id';

  String builMerchantAddMerchandImage(int id) =>
      '$baseUrl/livraison-service/marchand/fileUpload/$id';

  String builMerchantDeleteArticle(int id) =>
      '$baseUrl/livraison-service/article/delete/$id';

  String builDeleteCommand(int id) =>
      '$baseUrl/livraison-service/commande/delete/$id';

  String builMerchantFindByIdArticle(int id) =>
      '$baseUrl/livraison-service/article/$id';

  String builMerchantFindByIdMarchand(int id) =>
      '$baseUrl/livraison-service/marchand/$id';

  String builMerchantUpdateMerchand() =>
      '$baseUrl/livraison-service/marchand/edit';

  String builMerchantUpdateProduct() =>
      '$baseUrl/livraison-service/article/edit';

  String builMerchantArticles(PaginatedRequest request) =>
      '$baseUrl/livraison-service/article/page?page=${request.page}&size=${request.size}';

  String builMerchantCreateProductType() =>
      '$baseUrl/livraison-service/typeArticle/add';

  String builMerchantGetProductTypes(PaginatedRequest request) =>
      '$baseUrl/livraison-service/typeArticle/page?page=${request.page}&size=${request.size}';

  String builMerchantGetSells(PaginatedRequest request) =>
      '$baseUrl/livraison-service/vente/page?page=${request.page}&size=${request.size}';

  String builMerchantGetDeals(PaginatedRequest request, String marchand) =>
      '$baseUrl/payment-service/api/v1/deal/marchand?marchand=$marchand&page=${request.page}&size=${request.size}';

  // String builMerchantDeliveries(PaginatedRequest request) =>
  //     '$baseUrl/livraison-service/livraison/page?page=${request.page}&size=${request.size}';

  String builMerchantDeliveries(PaginatedRequest request) =>
      '$baseUrl/livraison-service/livraison/page?page=${request.page}&size=${request.size}';

  String buildGetAllUserDeliveries(PaginatedRequest request) =>
      '$baseUrl/livraison-service/commande/page?page=${request.page}&size=${request.size}';

  // Merchant Commissions
  String buildMerchantCommission(PaginatedRequest request) =>
      "$baseUrl/payment-service/api/v1/commission?page=${request.page}&size=${request.size}";

  // Merchant Commandes
  String buildMerchantOrders(PaginatedRequest request) =>
      "$baseUrl/livraison-service/commande/page/marchand?page=${request.page}&size=${request.size}";

  // Merchant Deliveries
  String buildMerchantDeliveries(PaginatedRequest request) =>
      "$baseUrl/livraison-service/commande/page?page=${request.page}&size=${request.size}";

  String builMerchantDailyCommandState(PaginatedRequest request) =>
      '$baseUrl/livraison-service/commande/page/marchand?page=${request.page}&size=${request.size}';

  String buildClientOrders(PaginatedRequest request) =>
      "$baseUrl/livraison-service/commande/page?page=${request.page}&size=${request.size}";

  String builGetCommand(int id) => '$baseUrl/livraison-service/commande/$id';

  String builMerchantDashboardCountCommandeMerchand() =>
      '$baseUrl/livraison-service/dashboard/marchand/countCommande';

  String builMerchantDashboardCountArticlesMerchand() =>
      '$baseUrl/livraison-service/dashboard/marchand/countArticle';

  String builMerchantDashboardCountLivraisonMerchand() =>
      '$baseUrl/livraison-service/dashboard/livreur/countLivraison';

  String builMerchantDashboardCountTransactions(String name) =>
      '$baseUrl/payment-service/api/v1/deal/count?marchand=$name';
  String buildDeleteAccount(int userId) =>
      '$baseUrl/auth-service/api/v1/auth/deleteAccount/$userId';

  // http://185.193.17.106:8085/auth-service/api/v1/auth/deleteAccount/$userId

}
