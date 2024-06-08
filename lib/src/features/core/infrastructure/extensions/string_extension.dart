extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    } else if (length == 1) {
      return toUpperCase();
    } else {
      return this[0].toUpperCase() + substring(1);
    }
  }

  String removeAllSpace() {
    return replaceAll(RegExp(r"\s+"), "");
  }
}
