import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'ifiranz_client';

  @override
  String get onboardingScreenTitleOneLabel => 'Bienvenue!';

  @override
  String get onboardingScreenDescriptionOneLabel => 'Emballer et se faire livrer n\'a\njamais été aussi facile';

  @override
  String get onboardingScreenTitleTwoLabel => 'Livraison rapide';

  @override
  String get onboardingScreenDescriptionTwoLabel => 'Livraison rapide à votre domicile, à votre\nbureau ou où que vous soyez';

  @override
  String get onboardingScreenTitleThreeLabel => 'Suivi du trajet';

  @override
  String get onboardingScreenDescriptionThreeLabel => 'Suivi en temps réel et livraison exacte\ndu produit une fois la commande passée';

  @override
  String get onboardingScreenGetStartedButtonLabel => 'Commencer';

  @override
  String get onboardingScreenAlreadyHaveAnAccountButtonLabel => 'J\'ai déjà un compte';

  @override
  String get onboardingScreenContinueButtonLabel => 'Continuer';

  @override
  String get loginScreenSucces => 'Connexion réussie!';

  @override
  String get loginScreenTitle => 'Connexion à Ifiranz';

  @override
  String get loginScreenDescription => 'Nous sommes heureux de vous revoir !';

  @override
  String get loginScreenRememeberMe => 'Se souvenir de moi';

  @override
  String get forgotPassword => 'Mot de passe oublié';

  @override
  String get phone => 'Numéro de téléphone';

  @override
  String get password => 'Mot de passe';

  @override
  String get orLoginWith => 'Ou se connecter avec';

  @override
  String get signinWithGoogle => 'Se connecter avec Google';

  @override
  String get loginScreenhanAnAccount => 'Vous n\'avez pas de compte ?';

  @override
  String get loginScreenSignUp => 'S\'inscrire';

  @override
  String connectWithEmailOrPhoneNumber(String isPhone) {
    String _temp0 = intl.Intl.selectLogic(
      isPhone,
      {
        'true': 'l\'Email',
        'other': 'le Numéro de téléphone',
      },
    );
    return 'Connexion avec $_temp0';
  }

  @override
  String get merchandAddCientScreenAddSucces => 'Added Successfully';

  @override
  String get registerScreenCreateAccount => 'Créer un compte';

  @override
  String get registerScreensubTitle => 'Ravi de vous rencontrer ! Entrez vos\ndétails et profitez de l\'application';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get signUP => 'Se connecter';

  @override
  String get registerWithGoogle => 'S\'inscrire avec Google';

  @override
  String get dontHaveAccount => 'Vous avez déjà un compte?';

  @override
  String get forgotOtpScreenOtp => 'Vérification du code OTP';

  @override
  String forgotOtpScreenOtpgetNotificationMessage(String isPhoneNumber, Object verifier) {
    String _temp0 = intl.Intl.selectLogic(
      isPhoneNumber,
      {
        'true': 'Vérifiez vos messages SMS.',
        'other': 'Vérifiez vos messages électroniques.',
      },
    );
    return '$_temp0 Nous vous avons envoyé le code PIN à $verifier';
  }

  @override
  String get forgotOtpScreenOtpSendInstruction => 'Envoyer les instructions';

  @override
  String get forgotOtpScreenOtpDidRecieveOtp => 'Vous n\'avez pas reçu le code OTP ?';

  @override
  String get forgotOtpScreenOtpResend => ' Renvoyer';

  @override
  String get fotgotPasswordScreen => 'Réinitialiser le mot de passe';

  @override
  String get fotgotPasswordScreenTitle => 'Entrez l\'adresse e-mail associée à votre compte actuel, et nous vous enverrons un e-mail avec les instructions pour réinitialiser votre mot de passe.';

  @override
  String fotgotPasswordScreenResetOptionMessage(String isResetByEmail) {
    String _temp0 = intl.Intl.selectLogic(
      isResetByEmail,
      {
        'true': 'Utiliser le numéro de téléphone',
        'other': 'Utiliser l\'e-mail',
      },
    );
    return '$_temp0';
  }

  @override
  String fotgotPasswordScreendontHaveAccount(String isResetByEmail, Object phone) {
    String _temp0 = intl.Intl.selectLogic(
      isResetByEmail,
      {
        'true': 'd\'adresse e-mail',
        'other': 'de numéro de téléphone',
      },
    );
    return 'Vous n\'avez pas $_temp0 $phone,';
  }

  @override
  String get resetPasswordScreenCreateNewpassword => 'Créer un nouveau mot de passe';

  @override
  String get resetPasswordScreenTitle => 'Votre nouveau mot de passe doit être différent des précédents.';

  @override
  String get resetPassword => 'Réinitialiser le mot de passe';

  @override
  String get registerAdditionnalInfoScreen => 'Informations supplémentaires';

  @override
  String get registerAdditionnalAddressDistrict => 'Adresse (Ville-Quartier)';

  @override
  String get registerAdditionnalLocationNeighborhood => 'Emplacement (point de repère du quartier)';

  @override
  String get registerAdditionnalLocation => 'Emplacement';

  @override
  String get submit => 'Soumettre';

  @override
  String get name => 'Nom';

  @override
  String get surname => 'Nom de famille';

  @override
  String get address => 'Adresse';

  @override
  String get home => 'Accueil';

  @override
  String get orders => 'Commandes';

  @override
  String get delivery => 'Livraison';

  @override
  String get clientHomeTabTopRatedArticles => 'Articles les mieux notés';

  @override
  String get clientHomeTabShowAll => 'Afficher tout';

  @override
  String get clientHomeTabShowTopProducts => 'Afficher les meilleurs produits';

  @override
  String get clientHomeTabNoDataFound => 'Aucune donnée trouvée';

  @override
  String get clientHomeTabRefreshingIndicatorIsRefetching => 'RefreshingIndicator';

  @override
  String get clientHomeTabRefreshingIndicatorChild => 'RefreshingIndicator';

  @override
  String get clientHomeTabNoDataText => 'No Data found';

  @override
  String get clientHomeTabSubmit => 'Soumettre';

  @override
  String get clientHomeTabName => 'Nom';

  @override
  String get clientHomeTabSurname => 'Nom de famille';

  @override
  String get clientHomeTabRefreshIndicator => 'Indicateur de rafraîchissement';

  @override
  String get clientHomeTabMainItemGetHandsOnTaroFoodInHybride => 'Découvrez le \nTARO';

  @override
  String get clientHomeTabMainItemDiscount => '-40%';

  @override
  String get clientHomeTabMainItemOrderNow => 'Commandez';

  @override
  String get clientCartScreenTitle => 'Panier';

  @override
  String get clientCartScreenEmptyCart => 'Panier vide';

  @override
  String get clientCartScreenClearCart => 'Vider le panier';

  @override
  String get clientCartScreenChoosePayment => 'Choisir la méthode de paiement';

  @override
  String get clientCartScreenAbort => 'Annuler';

  @override
  String get clientCartScreenSubtotal => 'Sous-total';

  @override
  String get clientCartScreenShippingFee => 'Frais de livraison';

  @override
  String get clientCartScreenTotal => 'Total';

  @override
  String get clientCartScreenEmptyCartMessage => 'Votre panier est vide.';

  @override
  String get clientCartScreenClearCartButton => 'Vider le panier';

  @override
  String get foodDetailsScreenOperationSuccess => 'Opération réussie';

  @override
  String get foodDetailsScreenOperationError => 'Échec de l\'opération';

  @override
  String get foodDetailsScreenName => 'Nom';

  @override
  String get foodDetailsScreenSeller => 'Vendeur';

  @override
  String get foodDetailsScreenAdress => 'Adresse';

  @override
  String get foodDetailsScreenSelectQuartier => 'Sélectionner le quartier';

  @override
  String get foodDetailsScreenLocation => 'Emplacement';

  @override
  String get foodDetailsScreenExactDeliveryPosition => 'Position de livraison exacte';

  @override
  String get foodDetailsScreenAddGPSLocation => 'Emplacement GPS';

  @override
  String get foodDetailsScreenCartAlreadyContainsProduct => 'Le panier contient déjà ce produit';

  @override
  String get foodDetailsScreenAddToCart => 'Ajouter au panier';

  @override
  String get foodDetailsScreenRateThisFood => 'Évaluez cet article';

  @override
  String get foodDetailsScreenGiveYourFeedback => 'Donnez votre avis';

  @override
  String get foodDetailsScreenSubmit => 'Soumettre';

  @override
  String get foodDetailsScreenListComments => 'Liste des commentaires';

  @override
  String get changeLanguge => 'Changer la langue du téléphone';

  @override
  String get save => 'Sauvegarder';

  @override
  String get next => 'Suivant';

  @override
  String get editPaymentInfo => 'Informations de paiement';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get myProfile => 'Mon profil';

  @override
  String get checkPrivate => 'J\'ai lu et j\'accepte les conditions d\'utilisation, les règles de combat et la politique de confidentialité';

  @override
  String get helpCenter => 'Centre d\'aide';

  @override
  String get language => 'Langue';

  @override
  String get settingsPreferences => 'Paramètres & Préférences';

  @override
  String get reportBug => 'Signaler un bug';

  @override
  String get logOut => 'Déconnexion';

  @override
  String get aboutUs => 'À propos de nous';

  @override
  String get order => 'Commande';

  @override
  String get item => 'Article';

  @override
  String get qty => 'Quantité';

  @override
  String get total => 'Total';

  @override
  String get takePicture => 'Prendre une photo';

  @override
  String get chooseInGallery => 'Choisir dans la galerie';

  @override
  String get giveYourFeedBack => 'Donner votre avis';

  @override
  String get leaveUsAComment => 'Laissez-nous un commentaire';

  @override
  String get loading => 'Chargement';

  @override
  String get orderDetails => 'Détails de la commande';

  @override
  String get designation => 'Désignation';

  @override
  String get amount => 'Montant';

  @override
  String get client => 'Client';

  @override
  String get deliveryStatus => 'Statut de livraison';

  @override
  String get search => 'Rechercher';

  @override
  String get rate => 'Noter';

  @override
  String get ditance => 'Distance';

  @override
  String get to => 'à';

  @override
  String get paymentMethod => 'Méthode de paiement';

  @override
  String get deliveryProcess => 'Processus de livraison';

  @override
  String get pending => 'En attente';

  @override
  String get all => 'Tous';

  @override
  String get accepted => 'Acceptée';

  @override
  String get cooking => 'Préparé';

  @override
  String get pickup => 'Récupéré';

  @override
  String get delivered => 'Livré';

  @override
  String get deliveredVerd => 'Deliver';

  @override
  String get deliverAtKimia => 'Livrer à Kimia';

  @override
  String deliveryCodeIs(Object code) {
    return 'Le code de livraison est $code';
  }

  @override
  String get clearFilter => 'Effacer les filtres';

  @override
  String get youCanSelectFromDifferentSeller => 'Vous ne pouvez pas sélectionner  deux article de vendeurs différents pour l\'instant';

  @override
  String get merchandHomeScreenWelcome => 'Bienvenue';

  @override
  String get merchandHomeScreenWhatsIfiranz => 'Qu\'est-ce qu\'Ifiranz';

  @override
  String get merchandHomeScreenHandsOn => 'Pratique';

  @override
  String get merchandHomeScreeHeyBro => 'Tutoriel';

  @override
  String get merchandHomeScreenDashboard => 'Tableau de bord';

  @override
  String get merchandHomeScreenClients => 'Clients';

  @override
  String get merchandHomeScreenDeliveries => 'Livraisons';

  @override
  String get merchandHomeScreenInventory => 'Inventaires';

  @override
  String get merchandHomeScreenTransactions => 'Transactions';

  @override
  String get products => 'Produits';

  @override
  String get valide => 'Commande reçue';

  @override
  String get nonValide => 'Commande non achevée';

  @override
  String get edit => 'Editer';

  @override
  String get myProducts => 'Mes produits';

  @override
  String get noDataText => 'Aucune donnée trouvée';

  @override
  String get merchandUpdateProdut => 'Mettre à jour le produit';

  @override
  String get merchandProductType => 'Type de produit';

  @override
  String get price => 'Prix';

  @override
  String get deleteConfirmationTitle => 'Confirmation de suppression';

  @override
  String get deleteConfirmationAction => 'Supprimer';

  @override
  String get deleteConfirmationCancel => 'Annuler';

  @override
  String get deleteConfirmationContent => 'Êtes-vous sûr de vouloir supprimer cet élément ?';

  @override
  String get startDate => 'Date de début';

  @override
  String get endDate => 'Date de fin';

  @override
  String get deliveryTodayClanhhenge => 'Today’s challenge';

  @override
  String percentOn(Object value) {
    return '$value% ON';
  }

  @override
  String percentOff(Object value) {
    return '$value% OFF';
  }

  @override
  String get promoDeliveryMessage => '+10 delivery\nbefore 6pm';

  @override
  String get accept => 'Accept';

  @override
  String get deny => 'Deny';

  @override
  String get refresh => 'refresh';

  @override
  String get pay => 'Payer';

  @override
  String get validatePaymentTitle => 'Veuillez confirmer l\'opération en tapant le code sur votre mobile.';

  @override
  String get validatePaymentOrange => '#150# - Orange';

  @override
  String get validatePaymentMTN => '*126# - MTN';

  @override
  String get annuler => 'Annuler';

  @override
  String get validatePaymentSubTitle => 'Lorque vous achevez le paiement cliquez sur vérifier';

  @override
  String get emptyComment => 'Pas de commentaires';

  @override
  String get comments => 'Commentaires';

  @override
  String get addClient => 'Ajouter un Client';

  @override
  String get operationSuccess => 'Opération réussie';

  @override
  String get operationError => 'Échec de l\'opération';

  @override
  String get payment => 'Paiement';

  @override
  String get invalidPhoneNumber => 'Numéro de télephone invalide';
}
