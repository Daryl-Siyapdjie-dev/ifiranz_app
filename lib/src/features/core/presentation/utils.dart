import 'package:intl/intl.dart';

extension FCFAFormatter on num {
  String formatMoney() {
    var format = NumberFormat.currency(
      locale: 'fr_FR',
      name: 'FCFA',
    );

    return format.format(this).split(',').isNotEmpty ? format.format(this).split(',')[0].toString() : format.format(this);
  }
}
