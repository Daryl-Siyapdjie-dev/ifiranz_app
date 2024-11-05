import 'package:flutter/material.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/presentation/themes/app_colors.dart';

class DeleteAccountDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteAccountDialog({required this.onConfirm, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        context.locale.deleteAccount,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          context.locale.deleteAccountWarning,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.greyTextTitleColor,
            height: 1.5,
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.only(bottom: 12, right: 12, left: 12),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.greyTextTitleColor,
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(context.locale.deleteConfirmationCancel),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(context.locale.deleteConfirmationAction),
        ),
      ],
    );
  }
}
