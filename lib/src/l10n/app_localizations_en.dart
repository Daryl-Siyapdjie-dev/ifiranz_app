import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ifiranz_client';

  @override
  String get onboardingScreenTitleOneLabel => 'Welcome!';

  @override
  String get onboardingScreenDescriptionOneLabel => 'Packing and Getting delivered has\nnever been easier.';

  @override
  String get onboardingScreenTitleTwoLabel => 'Fast Delivery';

  @override
  String get onboardingScreenDescriptionTwoLabel => 'Fast delivery to your home, office\nor wherever you are';

  @override
  String get onboardingScreenTitleThreeLabel => 'Tracking Destination';

  @override
  String get onboardingScreenDescriptionThreeLabel => 'Real time tracking and exact delivery\nproduct once you place the order';

  @override
  String get onboardingScreenGetStartedButtonLabel => 'Get started';

  @override
  String get onboardingScreenAlreadyHaveAnAccountButtonLabel => 'I already have an account';

  @override
  String get onboardingScreenContinueButtonLabel => 'Continue';

  @override
  String get loginScreenSucces => 'Connexion réussie!';

  @override
  String get loginScreenTitle => 'Login to Ifiranz';

  @override
  String get loginScreenDescription => 'We’re happy to see you back again!';

  @override
  String get loginScreenRememeberMe => 'Remember Me';

  @override
  String get forgotPassword => 'Forgot password';

  @override
  String get phone => 'Phone Number';

  @override
  String get password => 'Password';

  @override
  String get orLoginWith => 'Or Login With';

  @override
  String get signinWithGoogle => 'Sign In With Google';

  @override
  String get loginScreenhanAnAccount => 'Don\'t have an account?';

  @override
  String get loginScreenSignUp => 'Sign Up';

  @override
  String connectWithEmailOrPhoneNumber(String isPhone) {
    String _temp0 = intl.Intl.selectLogic(
      isPhone,
      {
        'true': 'Email',
        'other': 'Phone Number',
      },
    );
    return 'Connect with $_temp0';
  }

  @override
  String get merchandAddCientScreenAddSucces => 'Added Succesfully';

  @override
  String get registerScreenCreateAccount => 'Create account';

  @override
  String get registerScreensubTitle => 'Happy to meet you! Enter your\ndetails and enjoy the app';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get signUP => 'Login';

  @override
  String get registerWithGoogle => 'Register with Google';

  @override
  String get dontHaveAccount => 'Already have an account?';

  @override
  String get forgotOtpScreenOtp => 'OTP verification';

  @override
  String forgotOtpScreenOtpgetNotificationMessage(String isPhoneNumber, Object verifier) {
    String _temp0 = intl.Intl.selectLogic(
      isPhoneNumber,
      {
        'true': 'Check your SMS messages.',
        'other': 'Check your Emails messages.',
      },
    );
    return '$_temp0 We’ve sent you the pin at $verifier';
  }

  @override
  String get forgotOtpScreenOtpSendInstruction => 'Send Instructions';

  @override
  String get forgotOtpScreenOtpDidRecieveOtp => 'Didn’t receive OTP? ';

  @override
  String get forgotOtpScreenOtpResend => ' Re-send';

  @override
  String get fotgotPasswordScreen => 'Reset password';

  @override
  String get fotgotPasswordScreenTitle => 'Enter the email associated with your current account and we\'ll send an email with instructions to reset your password.';

  @override
  String fotgotPasswordScreenResetOptionMessage(String isResetByEmail) {
    String _temp0 = intl.Intl.selectLogic(
      isResetByEmail,
      {
        'true': 'Use phone number',
        'other': 'Use email',
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
        'other': 'de numéro de téléphone ',
      },
    );
    return 'Vous n\'avez pas $_temp0 $phone,';
  }

  @override
  String get resetPasswordScreenCreateNewpassword => 'Create new password';

  @override
  String get resetPasswordScreenTitle => 'Your new password must be different from previous used passwords.';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get registerAdditionnalInfoScreen => 'Additional Info';

  @override
  String get registerAdditionnalAddressDistrict => 'Address (City-District)';

  @override
  String get registerAdditionnalLocationNeighborhood => 'Location (neighborhood landmark)';

  @override
  String get registerAdditionnalLocation => 'Location';

  @override
  String get submit => 'Submit';

  @override
  String get name => 'Name';

  @override
  String get lastname => 'Lastname';

  @override
  String get surname => 'Surname';

  @override
  String get address => 'Address';

  @override
  String get home => 'Home';

  @override
  String get orders => 'Orders';

  @override
  String get delivery => 'Delivery';

  @override
  String get clientHomeTabTopRatedArticles => 'Top rated articles';

  @override
  String get clientHomeTabShowAll => 'Show all';

  @override
  String get clientHomeTabShowTopProducts => 'Show top products';

  @override
  String get clientHomeTabNoDataFound => 'No Data found';

  @override
  String get clientHomeTabRefreshingIndicatorIsRefetching => 'RefreshingIndicator';

  @override
  String get clientHomeTabRefreshingIndicatorChild => 'RefreshingIndicator';

  @override
  String get clientHomeTabNoDataText => 'No Data found';

  @override
  String get clientHomeTabSubmit => 'Submit';

  @override
  String get clientHomeTabName => 'Name';

  @override
  String get clientHomeTabSurname => 'Surname';

  @override
  String get clientHomeTabRefreshIndicator => 'RefreshIndicator';

  @override
  String get clientHomeTabMainItemGetHandsOnTaroFoodInHybride => 'Get hand’s on TARO \nfood in ';

  @override
  String get clientHomeTabMainItemDiscount => '40% OFF';

  @override
  String get clientHomeTabMainItemOrderNow => 'Order now';

  @override
  String get clientCartScreenTitle => 'Cart';

  @override
  String get clientCartScreenEmptyCart => 'Empty Cart';

  @override
  String get clientCartScreenClearCart => 'Clear Cart';

  @override
  String get clientCartScreenChoosePayment => 'Choose Payment Method';

  @override
  String get clientCartScreenAbort => 'Cancel';

  @override
  String get clientCartScreenSubtotal => 'Subtotal';

  @override
  String get clientCartScreenShippingFee => 'Shipping Fee';

  @override
  String get clientCartScreenTotal => 'Total';

  @override
  String get clientCartScreenEmptyCartMessage => 'Your cart is empty.';

  @override
  String get clientCartScreenClearCartButton => 'Clear Cart';

  @override
  String get foodDetailsScreenOperationSuccess => 'Operation successful';

  @override
  String get foodDetailsScreenOperationError => 'Operation failed';

  @override
  String get foodDetailsScreenName => 'Name';

  @override
  String get foodDetailsScreenSeller => 'Seller';

  @override
  String get foodDetailsScreenAdress => 'Address';

  @override
  String get foodDetailsScreenSelectQuartier => 'Select neighborhood';

  @override
  String get foodDetailsScreenLocation => 'Location';

  @override
  String get foodDetailsScreenExactDeliveryPosition => 'Exact delivery position';

  @override
  String get foodDetailsScreenAddGPSLocation => 'Choose delivery address';

  @override
  String get foodDetailsScreenCartAlreadyContainsProduct => 'The cart already contains this product';

  @override
  String get foodDetailsScreenAddToCart => 'Add to cart';

  @override
  String get foodDetailsScreenRateThisFood => 'Rate this article';

  @override
  String get foodDetailsScreenGiveYourFeedback => 'Give your feedback';

  @override
  String get foodDetailsScreenSubmit => 'Submit';

  @override
  String get foodDetailsScreenListComments => 'List of comments';

  @override
  String get changeLanguge => 'Change Phone language';

  @override
  String get save => 'Save';

  @override
  String get next => 'Next';

  @override
  String get editPaymentInfo => 'Payment information';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get myProfile => 'My profile';

  @override
  String get checkPrivate => 'I have read and accept the terms of use rules of fight and privacy policy';

  @override
  String get helpCenter => 'Help Center';

  @override
  String get language => 'Language';

  @override
  String get settingsPreferences => 'Settings & Preferences';

  @override
  String get reportBug => 'Report a bug';

  @override
  String get logOut => 'Log out';

  @override
  String get aboutUs => 'About us';

  @override
  String get order => 'Order';

  @override
  String get item => 'Item';

  @override
  String get qty => 'Qty';

  @override
  String get total => 'Total';

  @override
  String get takePicture => 'Take a picture';

  @override
  String get chooseInGallery => 'Choose in gallery';

  @override
  String get giveYourFeedBack => 'Give your feedback';

  @override
  String get leaveUsAComment => 'Leave us a comment';

  @override
  String get loading => 'Loading';

  @override
  String get orderDetails => 'Order details';

  @override
  String get designation => 'Designation';

  @override
  String get amount => 'Amount';

  @override
  String get client => 'Customer';

  @override
  String get deliveryStatus => 'Delivery Status';

  @override
  String get search => 'Search';

  @override
  String get rate => 'To Note';

  @override
  String get ditance => 'Distance';

  @override
  String get to => 'to';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get deliveryProcess => 'Delivery process';

  @override
  String get pending => 'Pending';

  @override
  String get all => 'All';

  @override
  String get accepted => 'Accepted';

  @override
  String get cooking => 'In progress';

  @override
  String get pickup => 'Pickup';

  @override
  String get delivered => 'Delivered';

  @override
  String get deliveredVerd => 'Deliver';

  @override
  String get deliverAtKimia => 'Deliver at Kimia';

  @override
  String deliveryCodeIs(Object code) {
    return 'Delivery Code is $code';
  }

  @override
  String get clearFilter => 'Clear filters';

  @override
  String get youCanSelectFromDifferentSeller => 'You cannot select item from two different sellers at this time';

  @override
  String get merchandHomeScreenWelcome => 'Welcome';

  @override
  String get merchandHomeScreenWhatsIfiranz => 'What\'s Ifiranz';

  @override
  String get merchandHomeScreenHandsOn => 'Hands on';

  @override
  String get merchandHomeScreeHeyBro => 'Tutorial';

  @override
  String get merchandHomeScreenDashboard => 'Dashboard';

  @override
  String get merchandHomeScreenClients => 'Clients';

  @override
  String get merchandHomeScreenDeliveries => 'Deliveries';

  @override
  String get merchandHomeScreenInventory => 'Inventories';

  @override
  String get merchandHomeScreenTransactions => 'Transactions';

  @override
  String get products => 'Products';

  @override
  String get valide => 'Order received';

  @override
  String get nonValide => 'Order not completed';

  @override
  String get edit => 'Edit';

  @override
  String get myProducts => 'My products';

  @override
  String get noDataText => 'No Data found';

  @override
  String get merchandUpdateProdut => 'Update Product';

  @override
  String get merchandProductType => 'Product Type';

  @override
  String get price => 'Price';

  @override
  String get deleteConfirmationTitle => 'Confirmation';

  @override
  String get deleteConfirmationAction => 'Delete';

  @override
  String get deleteConfirmationCancel => 'Cancel';

  @override
  String get deleteConfirmationContent => 'Are you sure you want to delete this item?';

  @override
  String get startDate => 'Start Date';

  @override
  String get endDate => 'End Date';

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
  String get pay => 'Pay';

  @override
  String get validatePaymentTitle => 'Veuillez confirmer l\'opération en tapant le code sur votre mobile.';

  @override
  String get validatePaymentOrange => '#150# - Orange';

  @override
  String get validatePaymentMTN => '*126# - MTN';

  @override
  String get annuler => 'Annuler';

  @override
  String get validatePaymentSubTitle => 'Lorque vous achevez le paiement, cliquez sur vérifier';

  @override
  String get emptyComment => 'No comments';

  @override
  String get comments => 'Comments';

  @override
  String get addClient => 'Add Client';

  @override
  String get operationSuccess => 'Operation successful';

  @override
  String get operationError => 'Operation failed';

  @override
  String get payment => 'Payment';

  @override
  String get invalidPhoneNumber => 'Invalid Phone number';

  @override
  String get colis => 'Colis';

  @override
  String get email => 'Email';

  @override
  String get createNewColisScreenDueAmount => 'Due Amount';
}
