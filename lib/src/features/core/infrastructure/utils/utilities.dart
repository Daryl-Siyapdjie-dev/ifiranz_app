import 'package:flutter/services.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:ifiranz_client/src/features/core/domain/enum.dart';
import 'package:intl/intl.dart';

String isoToEmoji(String code) {
  return code
      .split('')
      .map((letter) => String.fromCharCode(letter.codeUnitAt(0) % 32 + 0x1F1E5))
      .join('');
}

List<TextInputFormatter> mobileFormatters(String text, countryCode,
    {int? subscringLength}) {
  final country = CountryWithPhoneCode.getCountryDataByPhone(countryCode + text);

  if (country == null) {
    return [
      FilteringTextInputFormatter.digitsOnly,
    ];
  }
  return [
    FilteringTextInputFormatter.digitsOnly,
     LibPhonenumberTextFormatter(
       country: country,
     )
  ];
}

bool stepOrderValidator(
  String? status,
  OrderStatus level,
) {
  if (status == null) return false;
  OrderStatus step = OrderStatus.values.firstWhere(
      (e) => e.value.toLowerCase() == status.toLowerCase(),
      orElse: () => OrderStatus.accepte);
  if (step == OrderStatus.refuse) {
    return false;
  }
  if (step == OrderStatus.livre) {
    return true;
  }
  if (step == OrderStatus.accepte) {
    return level == OrderStatus.accepte;
  }
  if (step == OrderStatus.enPreparation) {
    if (level == OrderStatus.accepte || level == OrderStatus.enPreparation) {
      return true;
    }
  }
  if (step == OrderStatus.enCours) {
    if (level == OrderStatus.accepte ||
        level == OrderStatus.enPreparation ||
        level == OrderStatus.enCours) {
      return true;
    }
  }

  return false;
}

class Utils {
  static final dateFormater = DateFormat("yyyy-MM-dd HH:mm:ss");

  static String encodeDate(DateTime dateTime) =>
      DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateTime);

  static String dateFormat(DateTime dateTime) =>
      DateFormat('MMM d, yyyy HH:mm').format(dateTime);

  static String dateFormatToBookExpressService(DateTime dateTime) =>
      DateFormat('yyyy-MM-dd').format(dateTime);

  static String encodeDateToBookExpressService(DateTime dateTime) =>
      DateFormat("yyyy-MM-ddTHH:mm:ss0Z").format(dateTime);

  static String hourFormater(DateTime dateTime) =>
      DateFormat('HH:mm').format(dateTime);
}
