class Config {
  static const String environment = String.fromEnvironment('ENV', defaultValue: 'prod');

  static String get baseUrl {
    return environment == 'dev'
        ? 'http://185.193.17.106:8080'  // URL du serveur de test
        : 'https://ifiranz.com:8443';    // URL du serveur de production
  }
}
