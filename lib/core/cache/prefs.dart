import 'package:e_commerce/core/utils/constants/app_constants.dart' show AppConstants;
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  /// === Generic Methods ===
  static Future<void> setBool(String key, bool value) async =>
      await _instance.setBool(key, value);

  static bool getBool(String key) =>
      _instance.getBool(key) ?? false;

  static Future<void> setString(String key, String value) async =>
      await _instance.setString(key, value);

  static String? getString(String key) =>
      _instance.getString(key);

  static Future<bool> removeData({required String key}) async =>
      await _instance.remove(key);

  /// === Specific Shortcuts ===
  static Future<void> setSeenOnBoarding(bool value) async =>
      await setBool(AppConstants.seenOnBoarding, value);

  static bool hasSeenOnBoarding() =>
      getBool(AppConstants.seenOnBoarding);

  static Future<void> setIsLoggedIn(bool value) async =>
      await setBool(AppConstants.isLoggedIn, value);

  static bool isLoggedIn() =>
      getBool(AppConstants.isLoggedIn);
}
