import 'package:shared_preferences/shared_preferences.dart';

class DaysSmartBudget {
  static Future<int> getDays() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('days') ?? 30;
  }

  static Future<void> setDays(int days) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('days', days);
  }
}
