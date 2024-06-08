import 'package:country_picker/country_picker.dart' hide Country;
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart' as cps;
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/shared/providers.dart';

import '../../infrastructure/constants/app_sizes.dart';
import '../../infrastructure/utils/common_import.dart';
import '../../infrastructure/utils/utilities.dart';
import '../themes/app_colors.dart';
import 'common_textfield.dart';

class PhoneNumberTextFormField extends StatefulHookConsumerWidget {
  final TextEditingController phoneNumberController;
  final FocusNode? phoneNumberFocusNode;
  final void Function({
    String? phoneCode,
    String? countryCode,
    String? countryName,
    String? phonNumber,
  }) onChanged;
  final bool hasLabel;
  final String label;
  final bool isLabelRequired;
  const PhoneNumberTextFormField({
    super.key,
    required this.phoneNumberController,
    this.phoneNumberFocusNode,
    required this.onChanged,
    this.hasLabel = false,
    this.label = '',
    this.isLabelRequired = false,
  });

  @override
  ConsumerState<PhoneNumberTextFormField> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends ConsumerState<PhoneNumberTextFormField> {
  Country _selectedCountry = cps.CountryPickerUtils.getCountryByIsoCode("cm");

  @override
  void initState() {
    // final phoneNumber = ref
    //         .read(sharedPrefsRepositoryProvider)
    //         .getString(SharedPrefsConstants.userPhoneNumber) ??
    //     '';
    // widget.phoneNumberController.text = phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.hasLabel
        ? Column(
            mainAxisSize: MainAxisSize.min,
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
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.alertError,
                                  ),
                            )
                          ]
                        : null),
              ),
              gapH4,
              Consumer(
                builder: (context, ref, _) {
                  return CommonTextFormField(
                    controller: widget.phoneNumberController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    inputFormaters: mobileFormatters(
                      widget.phoneNumberController.text.trim(),
                      _selectedCountry.phoneCode,
                    ),
                    focusNode: widget.phoneNumberFocusNode,
                    hintText: context.locale.phone,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.phone,
                    prefixIcon: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (var country) {
                                  if (_selectedCountry.isoCode != country.countryCode) {
                                    setState(() {
                                      _selectedCountry = cps.CountryPickerUtils.getCountryByPhoneCode(country.phoneCode);
                                    });
                                    widget.onChanged(
                                      phoneCode: '+${_selectedCountry.phoneCode}',
                                      countryCode: _selectedCountry.isoCode,
                                      countryName: _selectedCountry.name,
                                      phonNumber: widget.phoneNumberController.text,
                                    );
                                  }
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  isoToEmoji(_selectedCountry.isoCode),
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
                                ),
                                const Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                          Text(
                            '+ ${_selectedCountry.phoneCode}',
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
                          ),
                          gapW6,
                        ],
                      ),
                    ),
                    // validator: ref
                    //     .read(formValidatorServiceProvider)
                    //     .validatePhoneNumber,
                    onChanged: (value) {
                      widget.onChanged(
                        phoneCode: '+${_selectedCountry.phoneCode}',
                        countryCode: _selectedCountry.isoCode,
                        countryName: _selectedCountry.name,
                        phonNumber: value,
                      );
                    },
                    onTap: () {
                      widget.phoneNumberFocusNode!.requestFocus();
                    },
                  );
                },
              ),
            ],
          )
        : Consumer(
            builder: (context, ref, _) {
              return CommonTextFormField(
                controller: widget.phoneNumberController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormaters: mobileFormatters(
                  widget.phoneNumberController.text.trim(),
                  _selectedCountry.phoneCode,
                ),
                focusNode: widget.phoneNumberFocusNode,
                // hintText: context.locale.signInScreenPhoneNumberHintLabel,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
                prefixIcon: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            useSafeArea: true,
                            onSelect: (var country) {
                              if (_selectedCountry.isoCode != country.countryCode) {
                                setState(() {
                                  _selectedCountry = cps.CountryPickerUtils.getCountryByPhoneCode(country.phoneCode);
                                });
                                widget.onChanged(
                                  phoneCode: '+${_selectedCountry.phoneCode}',
                                  countryCode: _selectedCountry.isoCode,
                                  countryName: _selectedCountry.name,
                                  phonNumber: widget.phoneNumberController.text,
                                );
                              }
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isoToEmoji(_selectedCountry.isoCode),
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
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                      Text(
                        '+ ${_selectedCountry.phoneCode}',
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
                      ),
                      gapW6,
                    ],
                  ),
                ),
                validator: ref.read(formValidationServiceProvider).validatePhoneNumber,
                onChanged: (value) {
                  widget.onChanged(
                    phoneCode: '+${_selectedCountry.phoneCode}',
                    countryCode: _selectedCountry.isoCode,
                    countryName: _selectedCountry.name,
                    phonNumber: value,
                  );
                },
                onTap: () {
                  widget.phoneNumberFocusNode!.requestFocus();
                },
                hintText: '',
              );
            },
          );
  }
}
