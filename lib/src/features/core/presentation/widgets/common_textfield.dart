import 'package:flutter/services.dart';

import '../../infrastructure/constants/app_sizes.dart';
import '../../infrastructure/utils/common_import.dart';
import '../themes/app_colors.dart';

class CommonTextFormField extends StatefulWidget {
  final String hintText;
  final String? intialValue;
  final String error;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool hasFocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final void Function(String?)? onChanged;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormaters;
  final AutovalidateMode? autovalidateMode;
  final bool hasLabel;
  final String label;
  final bool isLabelRequired, isEnabled;
  final int minLines, maxLines;

  const CommonTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      this.validator,
      this.hasFocus = false,
      this.focusNode,
      this.intialValue,
      this.error = '',
      this.textInputAction,
      this.textInputType,
      this.onChanged,
      this.onTap,
      this.inputFormaters,
      this.autovalidateMode,
      this.isEnabled = true,
      this.hasLabel = false,
      this.label = '',
      this.isLabelRequired = false,
      this.minLines = 1,
      this.maxLines = 1});

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool isShowPass = false;
  @override
  Widget build(BuildContext context) {
    return widget.hasLabel
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: widget.label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: AppColors.greyLight,
                        ),
                    children: widget.isLabelRequired
                        ? [
                            TextSpan(
                              text: ' *',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: AppColors.alertError,
                                  ),
                            )
                          ]
                        : null),
              ),
              gapH4,
              TextFormField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                minLines: widget.minLines,
                enabled: widget.isEnabled,
                obscureText: isShowPass ? false : widget.obscureText,
                validator: widget.validator,
                initialValue: widget.intialValue,
                keyboardType: widget.textInputType,
                maxLines: widget.maxLines,
                inputFormatters: widget.inputFormaters,
                autovalidateMode: widget.autovalidateMode,
                cursorColor: Theme.of(context).primaryColor,
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                textInputAction: widget.textInputAction,
                style: GoogleFonts.urbanist(
                  color: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(
                        color: AppColors.blackColor,
                      )
                      .color,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .2,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.obscureText
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isShowPass = !isShowPass;
                            });
                          },
                          icon: isShowPass
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.remove_red_eye))
                      : widget.suffixIcon,
                  hintText: widget.hintText,
                  errorText: widget.error.isNotEmpty ? widget.error : null,
                ),
              ),
            ],
          )
        : TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            obscureText: widget.obscureText,
            validator: widget.validator,
            initialValue: widget.intialValue,
            keyboardType: widget.textInputType,
            inputFormatters: widget.inputFormaters,
            autovalidateMode: widget.autovalidateMode,
            cursorColor: Theme.of(context).primaryColor,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            textInputAction: widget.textInputAction,
            style: GoogleFonts.urbanist(
              color: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(
                    color: AppColors.blackColor,
                  )
                  .color,
              fontWeight: FontWeight.w600,
              letterSpacing: .2,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              errorText: widget.error.isNotEmpty ? widget.error : null,
            ),
          );
  }
}
