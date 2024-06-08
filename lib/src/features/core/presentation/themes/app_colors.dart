import 'package:flutter/material.dart';
import 'package:ifiranz_client/src/features/core/domain/enum.dart';

class AppColors {
  static const primaryColor = Color(0xFFFF5C01);
  static const secondaryColor = Color(0xFF0A9C0D);

  static const scaffoldBackgroundColor = Colors.white;

  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const greyBackground = Color(0xFFF1F1F1);
  static const greyLight = Color(0xFFA8A8A8);
  static const greyDark = Color(0xFF4C4B4B);
  static const greyTextColor = Color(0xFFA8A8A8);
  static const greyTextTitleColor = Color(0xFF4C4B4B);

  static const iconGreyColor = Color(0xFFC1C0C9);
  static const transparent = Colors.transparent;

  static const errorColor = Color(0xFFF52D56);

  static const textFieldBackgroundColor = Color(0xFFF1EFEF);

  // Background
  static const bgRed = Color(0xFFFFF5F6);
  static const bgPurple = Color(0xFFF4ECFF);
  static const bgBlue = Color(0xFFF6FAFD);
  static const bgGreen = Color(0xFFF2FFFC);
  static const bgOrange = Color(0xFFFFF8ED);
  static const bgPink = Color(0xFFFFF5F5);
  static const bgYellow = Color(0xFFFFFEE0);
  static const bgWhite = Color(0xFFFAFAFA);
  static const bgGrey = Color(0xFFFAFAFA);
  static const bgGreyD = Color(0xFFF5F5F5);
  static const bgGreyLike = Color(0xFFEAEAEA);
  static const bgGreyItem = Color(0xFFF4F3F3);
  static const bgGreyIcon = Color(0xFFE6E6E6);
  static const bgGreyContainer = Color(0xFFF0F0F0);

  static const variantPinkColor = Color(0xFFFA00FF);
  static const variantGreenColor = Color(0xFF107312);

  // Alet
  static const alertSuccess = Color(0xFF4ADE80);
  static const alertInfo = Color(0xFF000AFF);
  static const alertWarning = Color(0xFFFACC15);
  static const alertError = Color(0xFFF75555);

  // shadows

  static const primaryShadow = Color.fromRGBO(142, 142, 142, 0.25);
  static const containerShadow = Color.fromRGBO(255, 255, 255, 0.25);

  static Color getColorForOrderStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepte:
        return variantPinkColor;
      case OrderStatus.refuse:
        return alertError;
      case OrderStatus.enPreparation:
        return alertInfo;
      case OrderStatus.enCours:
        return alertSuccess;
      case OrderStatus.livre:
        return alertWarning;
      default:
        return variantPinkColor.withOpacity(.6);
    }
  }
}
