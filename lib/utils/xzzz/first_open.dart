import 'package:shared_preferences/shared_preferences.dart';

class FirstOpenSmartBudget {
  static Future<bool> getFirstOpenSmartBudget() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isOpened') ?? false;
  }

  static Future<void> setFirstOpenSmartBudget() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isOpened', true);
  }
}
