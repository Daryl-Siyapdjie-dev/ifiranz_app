import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'ifiranz_client'**
  String get appTitle;

  /// No description provided for @onboardingScreenTitleOneLabel.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get onboardingScreenTitleOneLabel;

  /// No description provided for @onboardingScreenDescriptionOneLabel.
  ///
  /// In en, this message translates to:
  /// **'Packing and Getting delivered has\nnever been easier.'**
  String get onboardingScreenDescriptionOneLabel;

  /// No description provided for @onboardingScreenTitleTwoLabel.
  ///
  /// In en, this message translates to:
  /// **'Fast Delivery'**
  String get onboardingScreenTitleTwoLabel;

  /// No description provided for @onboardingScreenDescriptionTwoLabel.
  ///
  /// In en, this message translates to:
  /// **'Fast delivery to your home, office\nor wherever you are'**
  String get onboardingScreenDescriptionTwoLabel;

  /// No description provided for @onboardingScreenTitleThreeLabel.
  ///
  /// In en, this message translates to:
  /// **'Tracking Destination'**
  String get onboardingScreenTitleThreeLabel;

  /// No description provided for @onboardingScreenDescriptionThreeLabel.
  ///
  /// In en, this message translates to:
  /// **'Real time tracking and exact delivery\nproduct once you place the order'**
  String get onboardingScreenDescriptionThreeLabel;

  /// No description provided for @onboardingScreenGetStartedButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingScreenGetStartedButtonLabel;

  /// No description provided for @onboardingScreenAlreadyHaveAnAccountButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'I already have an account'**
  String get onboardingScreenAlreadyHaveAnAccountButtonLabel;

  /// No description provided for @onboardingScreenContinueButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingScreenContinueButtonLabel;

  /// No description provided for @loginScreenSucces.
  ///
  /// In en, this message translates to:
  /// **'Connexion réussie!'**
  String get loginScreenSucces;

  /// No description provided for @loginScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Login to Ifiranz'**
  String get loginScreenTitle;

  /// No description provided for @loginScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'We’re happy to see you back again!'**
  String get loginScreenDescription;

  /// No description provided for @loginScreenRememeberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get loginScreenRememeberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @orLoginWith.
  ///
  /// In en, this message translates to:
  /// **'Or Login With'**
  String get orLoginWith;

  /// No description provided for @signinWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign In With Google'**
  String get signinWithGoogle;

  /// No description provided for @loginScreenhanAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get loginScreenhanAnAccount;

  /// No description provided for @loginScreenSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get loginScreenSignUp;

  /// No description provided for @connectWithEmailOrPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Connect with {isPhone, select, true {Email} other {Phone Number}}'**
  String connectWithEmailOrPhoneNumber(String isPhone);

  /// No description provided for @merchandAddCientScreenAddSucces.
  ///
  /// In en, this message translates to:
  /// **'Added Succesfully'**
  String get merchandAddCientScreenAddSucces;

  /// No description provided for @registerScreenCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get registerScreenCreateAccount;

  /// No description provided for @registerScreensubTitle.
  ///
  /// In en, this message translates to:
  /// **'Happy to meet you! Enter your\ndetails and enjoy the app'**
  String get registerScreensubTitle;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @signUP.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get signUP;

  /// No description provided for @registerWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Register with Google'**
  String get registerWithGoogle;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get dontHaveAccount;

  /// No description provided for @forgotOtpScreenOtp.
  ///
  /// In en, this message translates to:
  /// **'OTP verification'**
  String get forgotOtpScreenOtp;

  /// No description provided for @forgotOtpScreenOtpgetNotificationMessage.
  ///
  /// In en, this message translates to:
  /// **'{isPhoneNumber, select, true {Check your SMS messages.} other {Check your Emails messages.}} We’ve sent you the pin at {verifier}'**
  String forgotOtpScreenOtpgetNotificationMessage(String isPhoneNumber, Object verifier);

  /// No description provided for @forgotOtpScreenOtpSendInstruction.
  ///
  /// In en, this message translates to:
  /// **'Send Instructions'**
  String get forgotOtpScreenOtpSendInstruction;

  /// No description provided for @forgotOtpScreenOtpDidRecieveOtp.
  ///
  /// In en, this message translates to:
  /// **'Didn’t receive OTP? '**
  String get forgotOtpScreenOtpDidRecieveOtp;

  /// No description provided for @forgotOtpScreenOtpResend.
  ///
  /// In en, this message translates to:
  /// **' Re-send'**
  String get forgotOtpScreenOtpResend;

  /// No description provided for @fotgotPasswordScreen.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get fotgotPasswordScreen;

  /// No description provided for @fotgotPasswordScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the email associated with your current account and we\'ll send an email with instructions to reset your password.'**
  String get fotgotPasswordScreenTitle;

  /// No description provided for @fotgotPasswordScreenResetOptionMessage.
  ///
  /// In en, this message translates to:
  /// **'{isResetByEmail, select, true  {Use phone number} other {Use email}}'**
  String fotgotPasswordScreenResetOptionMessage(String isResetByEmail);

  /// No description provided for @fotgotPasswordScreendontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Vous n\'avez pas {isResetByEmail, select, true {d\'adresse e-mail} other {de numéro de téléphone }} {phone},'**
  String fotgotPasswordScreendontHaveAccount(String isResetByEmail, Object phone);

  /// No description provided for @resetPasswordScreenCreateNewpassword.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get resetPasswordScreenCreateNewpassword;

  /// No description provided for @resetPasswordScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Your new password must be different from previous used passwords.'**
  String get resetPasswordScreenTitle;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @registerAdditionnalInfoScreen.
  ///
  /// In en, this message translates to:
  /// **'Additional Info'**
  String get registerAdditionnalInfoScreen;

  /// No description provided for @registerAdditionnalAddressDistrict.
  ///
  /// In en, this message translates to:
  /// **'Address (City-District)'**
  String get registerAdditionnalAddressDistrict;

  /// No description provided for @registerAdditionnalLocationNeighborhood.
  ///
  /// In en, this message translates to:
  /// **'Location (neighborhood landmark)'**
  String get registerAdditionnalLocationNeighborhood;

  /// No description provided for @registerAdditionnalLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get registerAdditionnalLocation;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @lastname.
  ///
  /// In en, this message translates to:
  /// **'Lastname'**
  String get lastname;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @clientHomeTabTopRatedArticles.
  ///
  /// In en, this message translates to:
  /// **'Top rated articles'**
  String get clientHomeTabTopRatedArticles;

  /// No description provided for @clientHomeTabShowAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get clientHomeTabShowAll;

  /// No description provided for @clientHomeTabShowTopProducts.
  ///
  /// In en, this message translates to:
  /// **'Show top products'**
  String get clientHomeTabShowTopProducts;

  /// No description provided for @clientHomeTabNoDataFound.
  ///
  /// In en, this message translates to:
  /// **'No Data found'**
  String get clientHomeTabNoDataFound;

  /// No description provided for @clientHomeTabRefreshingIndicatorIsRefetching.
  ///
  /// In en, this message translates to:
  /// **'RefreshingIndicator'**
  String get clientHomeTabRefreshingIndicatorIsRefetching;

  /// No description provided for @clientHomeTabRefreshingIndicatorChild.
  ///
  /// In en, this message translates to:
  /// **'RefreshingIndicator'**
  String get clientHomeTabRefreshingIndicatorChild;

  /// No description provided for @clientHomeTabNoDataText.
  ///
  /// In en, this message translates to:
  /// **'No Data found'**
  String get clientHomeTabNoDataText;

  /// No description provided for @clientHomeTabSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get clientHomeTabSubmit;

  /// No description provided for @clientHomeTabName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get clientHomeTabName;

  /// No description provided for @clientHomeTabSurname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get clientHomeTabSurname;

  /// No description provided for @clientHomeTabRefreshIndicator.
  ///
  /// In en, this message translates to:
  /// **'RefreshIndicator'**
  String get clientHomeTabRefreshIndicator;

  /// No description provided for @clientHomeTabMainItemGetHandsOnTaroFoodInHybride.
  ///
  /// In en, this message translates to:
  /// **'Get hand’s on TARO \nfood in '**
  String get clientHomeTabMainItemGetHandsOnTaroFoodInHybride;

  /// No description provided for @clientHomeTabMainItemDiscount.
  ///
  /// In en, this message translates to:
  /// **'40% OFF'**
  String get clientHomeTabMainItemDiscount;

  /// No description provided for @clientHomeTabMainItemOrderNow.
  ///
  /// In en, this message translates to:
  /// **'Order now'**
  String get clientHomeTabMainItemOrderNow;

  /// No description provided for @clientCartScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get clientCartScreenTitle;

  /// No description provided for @clientCartScreenEmptyCart.
  ///
  /// In en, this message translates to:
  /// **'Empty Cart'**
  String get clientCartScreenEmptyCart;

  /// No description provided for @clientCartScreenClearCart.
  ///
  /// In en, this message translates to:
  /// **'Clear Cart'**
  String get clientCartScreenClearCart;

  /// No description provided for @clientCartScreenChoosePayment.
  ///
  /// In en, this message translates to:
  /// **'Choose Payment Method'**
  String get clientCartScreenChoosePayment;

  /// No description provided for @clientCartScreenAbort.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get clientCartScreenAbort;

  /// No description provided for @clientCartScreenSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get clientCartScreenSubtotal;

  /// No description provided for @clientCartScreenShippingFee.
  ///
  /// In en, this message translates to:
  /// **'Shipping Fee'**
  String get clientCartScreenShippingFee;

  /// No description provided for @clientCartScreenTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get clientCartScreenTotal;

  /// No description provided for @clientCartScreenEmptyCartMessage.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty.'**
  String get clientCartScreenEmptyCartMessage;

  /// No description provided for @clientCartScreenClearCartButton.
  ///
  /// In en, this message translates to:
  /// **'Clear Cart'**
  String get clientCartScreenClearCartButton;

  /// No description provided for @foodDetailsScreenOperationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Operation successful'**
  String get foodDetailsScreenOperationSuccess;

  /// No description provided for @foodDetailsScreenOperationError.
  ///
  /// In en, this message translates to:
  /// **'Operation failed'**
  String get foodDetailsScreenOperationError;

  /// No description provided for @foodDetailsScreenName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get foodDetailsScreenName;

  /// No description provided for @foodDetailsScreenSeller.
  ///
  /// In en, this message translates to:
  /// **'Seller'**
  String get foodDetailsScreenSeller;

  /// No description provided for @foodDetailsScreenAdress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get foodDetailsScreenAdress;

  /// No description provided for @foodDetailsScreenSelectQuartier.
  ///
  /// In en, this message translates to:
  /// **'Select neighborhood'**
  String get foodDetailsScreenSelectQuartier;

  /// No description provided for @foodDetailsScreenLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get foodDetailsScreenLocation;

  /// No description provided for @foodDetailsScreenExactDeliveryPosition.
  ///
  /// In en, this message translates to:
  /// **'Exact delivery position'**
  String get foodDetailsScreenExactDeliveryPosition;

  /// No description provided for @foodDetailsScreenAddGPSLocation.
  ///
  /// In en, this message translates to:
  /// **'Choose delivery address'**
  String get foodDetailsScreenAddGPSLocation;

  /// No description provided for @foodDetailsScreenCartAlreadyContainsProduct.
  ///
  /// In en, this message translates to:
  /// **'The cart already contains this product'**
  String get foodDetailsScreenCartAlreadyContainsProduct;

  /// No description provided for @foodDetailsScreenAddToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get foodDetailsScreenAddToCart;

  /// No description provided for @foodDetailsScreenRateThisFood.
  ///
  /// In en, this message translates to:
  /// **'Rate this article'**
  String get foodDetailsScreenRateThisFood;

  /// No description provided for @foodDetailsScreenGiveYourFeedback.
  ///
  /// In en, this message translates to:
  /// **'Give your feedback'**
  String get foodDetailsScreenGiveYourFeedback;

  /// No description provided for @foodDetailsScreenSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get foodDetailsScreenSubmit;

  /// No description provided for @foodDetailsScreenListComments.
  ///
  /// In en, this message translates to:
  /// **'List of comments'**
  String get foodDetailsScreenListComments;

  /// No description provided for @changeLanguge.
  ///
  /// In en, this message translates to:
  /// **'Change Phone language'**
  String get changeLanguge;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @editPaymentInfo.
  ///
  /// In en, this message translates to:
  /// **'Payment information'**
  String get editPaymentInfo;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get myProfile;

  /// No description provided for @checkPrivate.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept the terms of use rules of fight and privacy policy'**
  String get checkPrivate;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @settingsPreferences.
  ///
  /// In en, this message translates to:
  /// **'Settings & Preferences'**
  String get settingsPreferences;

  /// No description provided for @reportBug.
  ///
  /// In en, this message translates to:
  /// **'Report a bug'**
  String get reportBug;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutUs;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// No description provided for @qty.
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @takePicture.
  ///
  /// In en, this message translates to:
  /// **'Take a picture'**
  String get takePicture;

  /// No description provided for @chooseInGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose in gallery'**
  String get chooseInGallery;

  /// No description provided for @giveYourFeedBack.
  ///
  /// In en, this message translates to:
  /// **'Give your feedback'**
  String get giveYourFeedBack;

  /// No description provided for @leaveUsAComment.
  ///
  /// In en, this message translates to:
  /// **'Leave us a comment'**
  String get leaveUsAComment;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order details'**
  String get orderDetails;

  /// No description provided for @designation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get designation;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @client.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get client;

  /// No description provided for @deliveryStatus.
  ///
  /// In en, this message translates to:
  /// **'Delivery Status'**
  String get deliveryStatus;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'To Note'**
  String get rate;

  /// No description provided for @ditance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get ditance;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @deliveryProcess.
  ///
  /// In en, this message translates to:
  /// **'Delivery process'**
  String get deliveryProcess;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @cooking.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get cooking;

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get pickup;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @deliveredVerd.
  ///
  /// In en, this message translates to:
  /// **'Deliver'**
  String get deliveredVerd;

  /// No description provided for @deliverAtKimia.
  ///
  /// In en, this message translates to:
  /// **'Deliver at Kimia'**
  String get deliverAtKimia;

  /// No description provided for @deliveryCodeIs.
  ///
  /// In en, this message translates to:
  /// **'Delivery Code is {code}'**
  String deliveryCodeIs(Object code);

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get clearFilter;

  /// No description provided for @youCanSelectFromDifferentSeller.
  ///
  /// In en, this message translates to:
  /// **'You cannot select item from two different sellers at this time'**
  String get youCanSelectFromDifferentSeller;

  /// No description provided for @merchandHomeScreenWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get merchandHomeScreenWelcome;

  /// No description provided for @merchandHomeScreenWhatsIfiranz.
  ///
  /// In en, this message translates to:
  /// **'What\'s Ifiranz'**
  String get merchandHomeScreenWhatsIfiranz;

  /// No description provided for @merchandHomeScreenHandsOn.
  ///
  /// In en, this message translates to:
  /// **'Hands on'**
  String get merchandHomeScreenHandsOn;

  /// No description provided for @merchandHomeScreeHeyBro.
  ///
  /// In en, this message translates to:
  /// **'Tutorial'**
  String get merchandHomeScreeHeyBro;

  /// No description provided for @merchandHomeScreenDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get merchandHomeScreenDashboard;

  /// No description provided for @merchandHomeScreenClients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get merchandHomeScreenClients;

  /// No description provided for @merchandHomeScreenDeliveries.
  ///
  /// In en, this message translates to:
  /// **'Deliveries'**
  String get merchandHomeScreenDeliveries;

  /// No description provided for @merchandHomeScreenInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventories'**
  String get merchandHomeScreenInventory;

  /// No description provided for @merchandHomeScreenTransactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get merchandHomeScreenTransactions;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @valide.
  ///
  /// In en, this message translates to:
  /// **'Order received'**
  String get valide;

  /// No description provided for @nonValide.
  ///
  /// In en, this message translates to:
  /// **'Order not completed'**
  String get nonValide;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @myProducts.
  ///
  /// In en, this message translates to:
  /// **'My products'**
  String get myProducts;

  /// No description provided for @noDataText.
  ///
  /// In en, this message translates to:
  /// **'No Data found'**
  String get noDataText;

  /// No description provided for @merchandUpdateProdut.
  ///
  /// In en, this message translates to:
  /// **'Update Product'**
  String get merchandUpdateProdut;

  /// No description provided for @merchandProductType.
  ///
  /// In en, this message translates to:
  /// **'Product Type'**
  String get merchandProductType;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @deleteConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get deleteConfirmationTitle;

  /// No description provided for @deleteConfirmationAction.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteConfirmationAction;

  /// No description provided for @deleteConfirmationCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get deleteConfirmationCancel;

  /// No description provided for @deleteConfirmationContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this item?'**
  String get deleteConfirmationContent;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @deliveryTodayClanhhenge.
  ///
  /// In en, this message translates to:
  /// **'Today’s challenge'**
  String get deliveryTodayClanhhenge;

  /// No description provided for @percentOn.
  ///
  /// In en, this message translates to:
  /// **'{value}% ON'**
  String percentOn(Object value);

  /// No description provided for @percentOff.
  ///
  /// In en, this message translates to:
  /// **'{value}% OFF'**
  String percentOff(Object value);

  /// No description provided for @promoDeliveryMessage.
  ///
  /// In en, this message translates to:
  /// **'+10 delivery\nbefore 6pm'**
  String get promoDeliveryMessage;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @deny.
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get deny;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'refresh'**
  String get refresh;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @validatePaymentTitle.
  ///
  /// In en, this message translates to:
  /// **'Veuillez confirmer l\'opération en tapant le code sur votre mobile.'**
  String get validatePaymentTitle;

  /// No description provided for @validatePaymentOrange.
  ///
  /// In en, this message translates to:
  /// **'#150# - Orange'**
  String get validatePaymentOrange;

  /// No description provided for @validatePaymentMTN.
  ///
  /// In en, this message translates to:
  /// **'*126# - MTN'**
  String get validatePaymentMTN;

  /// No description provided for @annuler.
  ///
  /// In en, this message translates to:
  /// **'Annuler'**
  String get annuler;

  /// No description provided for @validatePaymentSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Lorque vous achevez le paiement, cliquez sur vérifier'**
  String get validatePaymentSubTitle;

  /// No description provided for @emptyComment.
  ///
  /// In en, this message translates to:
  /// **'No comments'**
  String get emptyComment;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @addClient.
  ///
  /// In en, this message translates to:
  /// **'Add Client'**
  String get addClient;

  /// No description provided for @operationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Operation successful'**
  String get operationSuccess;

  /// No description provided for @operationError.
  ///
  /// In en, this message translates to:
  /// **'Operation failed'**
  String get operationError;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone number'**
  String get invalidPhoneNumber;

  /// No description provided for @colis.
  ///
  /// In en, this message translates to:
  /// **'Colis'**
  String get colis;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @createNewColisScreenDueAmount.
  ///
  /// In en, this message translates to:
  /// **'Due Amount'**
  String get createNewColisScreenDueAmount;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
