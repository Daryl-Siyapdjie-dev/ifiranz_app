import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/utils/api_constants.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';

Future showSuccessFlushbar(BuildContext context, String message) async {
  await _showFlushbar(
    context,
    message,
    Icons.info,
    AppColors.alertSuccess,
    AppColors.bgGreen,
    AppColors.alertSuccess,
  );
}

Future showErrorFlushbar(BuildContext context, String message) async {
  await _showFlushbar(
    context,
    message,
    Icons.info,
    AppColors.alertError,
    AppColors.bgRed,
    AppColors.alertError,
  );
}

Future _showFlushbar(
  BuildContext context,
  String message,
  IconData iconData,
  Color iconColor,
  Color backgroundColor,
  Color messageColor,
) async {
  await Flushbar(
    message: message,
    icon: Icon(
      iconData,
      color: iconColor,
    ),
    borderRadius: BorderRadius.circular(10),
    backgroundColor: backgroundColor,
    messageColor: messageColor,
    duration: const Duration(seconds: ApiConstants.flushbarDuration),
    margin: const EdgeInsets.all(16),
  ).show(context);
}
