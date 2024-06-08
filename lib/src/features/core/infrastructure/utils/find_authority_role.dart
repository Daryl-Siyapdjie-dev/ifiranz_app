String? findAuthorityRole(List<Map<String, dynamic>> arrayOfMaps) {
  for (var map in arrayOfMaps) {
    if (map.containsKey("authority") &&
        map["authority"].toString().startsWith("role_")) {
      return map['authority'];
    }
  }
  return null;
}

abstract class Authories {
  static const String delivery = "role_deliver";
  static const String merchant = "role_marchand";
  static const String admin = "role_administrator";
}
