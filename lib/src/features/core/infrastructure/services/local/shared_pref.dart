import 'dart:convert';

import 'package:ifiranz_client/src/features/auth/core/domain/client.dart';
import 'package:ifiranz_client/src/features/client/home/domain/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../delivery/orders/domain/delivery_models.dart';

abstract class SharedPref {
  static SharedPreferences? _prefs;
  static const String _token = "token";
  static const String _userIsRegistredPhone = "user_phone";
  static const String _fcmToken = "fcmToken";
  static const String _localUser = "localUser";
  static const String _localClientUser = "localClientUser";
  static const String _localDeliverUser = "localDeliverUser";

  static const String _id = "id";
  static const String _email = "email";
  static const String _profile = "profile";
  static const String _locale = "locale";
  static const String _localClientSearchHistory = "local_client_search_history";

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static Future<bool> clear() async => _prefs!.clear();

  static String? getToken() => _prefs!.getString(_token);

  static String? getLocale() => _prefs!.getString(_locale);

  static String? getHasEndAccountCreationPhone() =>
      _prefs!.getString(_userIsRegistredPhone);

  static void clearHasEndAccountCreationPhone() =>
      _prefs!.remove(_userIsRegistredPhone);

  static Merchant? getLocalUser() {
    return _prefs!.getString(_localUser) is String
        ? Merchant.fromJson(json.decode(_prefs!.getString(_localUser)!))
        : null;
  }

  static Livreur? getLocalDeliver() {
    return _prefs!.getString(_localDeliverUser) is String
        ? Livreur.fromJson(json.decode(_prefs!.getString(_localDeliverUser)!))
        : null;
  }

  static Client? getClientLocalUser() {
    return _prefs!.getString(_localClientUser) is String
        ? Client.fromJson(json.decode(_prefs!.getString(_localClientUser)!))
        : null;
  }

  static String? get getFcmToken => _prefs!.getString(_fcmToken);
  static int? getId() => _prefs!.getInt(_id);
  static String? getEmail() => _prefs!.getString(_email);
  static String? getProfile() => _prefs!.getString(_profile);


  static Future setToken(String value) async =>
      _prefs!.setString(_token, value);

  static Future setLocale(String value) async =>
      _prefs!.setString(_locale, value);

  static void setHasEndAccountCreationPhone(String value) async =>
      await _prefs!.setString(_userIsRegistredPhone, value);

  static Future setLocalUser(Merchant value) async {
    _prefs!.setString(_localUser, json.encode(value.toJson()));
  }

  static Future setClientLocalUser(Client value) async {
    _prefs!.setString(_localClientUser, json.encode(value.toJson()));
  }

  static Future setDeliverLocalUser(Livreur value) async {
    _prefs!.setString(_localDeliverUser, json.encode(value.toJson()));
  }

  static set fcmToken(String value) => _prefs!.setString(_fcmToken, value);

  static Future setId(int value) async => _prefs!.setInt(_id, value);

  static Future setEmail(String value) async =>
      _prefs!.setString(_email, value);

  static Future setProfile(String value) async =>
      _prefs!.setString(_profile, value);

  static Future<List<String>?> get getLocalClientSearchHistory async {
    return _prefs!.getStringList(_localClientSearchHistory);
  }

  static Future setLocalClientSearchHistory(List<String> values) async {
    return _prefs!.setStringList(_localClientSearchHistory, values);
  }

  static Future clearLocalClientSearchHistory() async {
    return _prefs!.setStringList(_localClientSearchHistory, []);
  }

  static Future<bool> removeItemFromLocalClientSearchHistory(
      String value) async {
    List<String>? searchHistory = await getLocalClientSearchHistory;
    if (searchHistory != null) {
      searchHistory.remove(value);
      return _prefs!.setStringList(_localClientSearchHistory, searchHistory);
    }
    return false;
  }

  static Future<bool> addSingleItemToLocalClientSearchHistory(
      String value) async {
    List<String>? searchHistory = await getLocalClientSearchHistory;
    if (searchHistory != null) {
      if (searchHistory.contains(value)) {
        return false;
      }
      if (searchHistory.length >= 7) {
        searchHistory.removeRange(0, searchHistory.length - 6);
      }
      searchHistory.add(value);
      return _prefs!.setStringList(_localClientSearchHistory, searchHistory);
    } else {
      return _prefs!.setStringList(_localClientSearchHistory, [value]);
    }
  }
}
