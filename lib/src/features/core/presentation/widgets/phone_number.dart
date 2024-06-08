import 'dart:async';
import 'dart:math' as math;

import 'package:country_picker/country_picker.dart' hide Country;
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart' as cps;
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/constants/app_sizes.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/localization_extension.dart';
import 'package:ifiranz_client/src/features/core/infrastructure/extensions/theme_extension.dart';
import 'package:libphonenumber/libphonenumber.dart';

import '../../infrastructure/utils/utilities.dart';
import '../themes/app_colors.dart';
import 'common_textfield.dart';

class PhoneNumberWidget extends StatefulWidget {
  final TextEditingController controller, isoCode;

  const PhoneNumberWidget({super.key, required this.controller, required this.isoCode});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  Country _country = cps.CountryPickerUtils.getCountryByIsoCode("cm");
  final FocusNode _focus = FocusNode();
  bool isFocus = false;
  final StreamError errorController = StreamError();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      try {
        _country = widget.isoCode.text.isNotEmpty ? cps.CountryPickerUtils.getCountryByPhoneCode(widget.isoCode.text.replaceAll('+', '')) : _country;

        widget.isoCode.text = widget.isoCode.text.isNotEmpty ? _country.isoCode : _country.isoCode;

        setState(() {});
      } catch (_) {}
    });
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    errorController.input.close();
    _focus.dispose();
  }

  void _onFocusChange() {
    isFocus = _focus.hasFocus;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: context.locale.phone,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: AppColors.greyLight,
                      ),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: context.theme.colorScheme.error),
                    )
                  ]),
            ),
            gapH4,
            Container(
              decoration: BoxDecoration(color: Theme.of(context).inputDecorationTheme.fillColor, borderRadius: BorderRadius.circular(9)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      showCountryPicker(
                        useSafeArea: true,
                        useRootNavigator: true,
                        context: context,

                        showPhoneCode: true, // optional. Shows phone code before the country name.
                        onSelect: (var country) {
                          if (_country.isoCode != country.countryCode) {
                            widget.controller.clear();
                          }
                          _country = cps.CountryPickerUtils.getCountryByPhoneCode(country.phoneCode);
                          widget.isoCode.text = _country.isoCode;
                          setState(() {});
                        },
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        gapW12,
                        SizedBox(
                          height: 26,
                          width: 26,
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            backgroundImage: AssetImage(CountryPickerUtils.getFlagImageAssetPath(_country.isoCode), package: "country_pickers"),
                          ),
                        ),
                        gapW5,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Transform.rotate(
                              angle: -math.pi / 2,
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 12,
                              )),
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 1,
                    color: context.theme.colorScheme.onBackground,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('+ ${_country.phoneCode}'),
                  Expanded(
                    child: CommonTextFormField(
                      hintText: context.locale.phone,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.phone,
                      controller: widget.controller,
                      focusNode: _focus,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        PhoneNumberUtil.isValidPhoneNumber(
                          isoCode: widget.isoCode.text.trim(),
                          phoneNumber: widget.controller.text.trim(),
                        ).then((res) {
                          if (res == true) {
                            errorController.input.add(null);
                          } else {
                            errorController.input.add(context.locale.invalidPhoneNumber);
                          }
                        });

                        return null;
                      },
                      inputFormaters: mobileFormatters(widget.controller.text.trim(), _country.phoneCode),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
        StreamBuilder<String?>(
            stream: errorController.output,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data! != "") {
                return Padding(
                    padding: const EdgeInsets.only(left: 12, top: 10),
                    child: Text(
                      snapshot.data!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.red),
                    ));
              }

              return Container();
            })
      ],
    );
  }
}

class StreamError {
  final StreamController<String?> historiyController = StreamController<String?>.broadcast();

  StreamSink<String?> get input => historiyController.sink;

  Stream<String?> get output => historiyController.stream;

  get dispose => historiyController.close();
}

class TextBackgroundPainter extends CustomPainter {
  final String text;

  const TextBackgroundPainter({required this.text});

  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      fontSize: 40,
    );

    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final backgroundRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(100),
    );

    final backgroundPaint = Paint()..color = Colors.transparent;
    canvas.drawRRect(backgroundRect, backgroundPaint);

    final textOffset = Offset(
      -10,
      (size.height - textPainter.height) / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
