class HeaderBuilder {
  static Map<String, dynamic> resetPasswordHeaders(String token) =>
      {'Authorization': 'Bearer $token'};

  static Map<String, dynamic> authHeaders(String? token) {
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'accept': 'application/json'
    };
  }
}
