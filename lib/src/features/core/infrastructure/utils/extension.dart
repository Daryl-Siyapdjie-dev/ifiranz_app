import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toFormattedString() {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(toUtc());
  }
}

extension DateTimeExtension on DateTime {
  String formatToCustomString() {
    final dayOfWeekFormat = DateFormat
        .EEEE(); // EEEE represents the full day of the week based on locale
    final timeFormat =
        DateFormat.jm(); // jm represents the time format based on locale

    var localDateTime = DateTime.now();

    var differenceInHours = localDateTime.timeZoneOffset.inHours;
    final dayOfWeek =
        dayOfWeekFormat.format(add(Duration(hours: differenceInHours)));
    final formattedTime =
        timeFormat.format(add(Duration(hours: differenceInHours)));
    return '$dayOfWeek  $formattedTime';
  }

  DateTime formatToCustomDate() {
    var localDateTime = DateTime.now();

    var differenceInHours = localDateTime.timeZoneOffset.inHours;
    final dayOfWeek = add(Duration(hours: differenceInHours));
    final formattedTime = add(Duration(hours: differenceInHours));

    return DateTime(dayOfWeek.year, dayOfWeek.month, dayOfWeek.day,
        formattedTime.hour, formattedTime.minute);
  }
}

String formatToHumanFriendly(DateTime dateTime) {
  DateFormat dateFormat = DateFormat.yMMMMd();
  DateFormat timeFormat = DateFormat.jm();

  var localDateTime = DateTime.now();

  var differenceInHours = localDateTime.timeZoneOffset.inHours;
  String datePart =
      dateFormat.format(dateTime.add(Duration(hours: differenceInHours)));
  String timePart =
      timeFormat.format(dateTime.add(Duration(hours: differenceInHours)));

  return '$datePart - $timePart';
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

extension StringExtensionLength on String {
  String truncateWithEllipsis(int maxLength) {
    if (length <= maxLength) {
      return this;
    } else {
      final truncatedString = substring(0, maxLength);
      final lastSpaceIndex = truncatedString.lastIndexOf(' ');

      if (lastSpaceIndex != -1) {
        return '${truncatedString.substring(0, lastSpaceIndex)}...';
      } else {
        return '$truncatedString...';
      }
    }
  }
}
