import 'package:shared_preferences/shared_preferences.dart';

class DaysSmartBudget {
  static Future<int> getDays() async {
    final perfers = await SharedPreferences.getInstance();
    return perfers.getInt('days') ?? 30;
  }

  static Future<void> setDays(int days) async {
    final perfers = await SharedPreferences.getInstance();
    perfers.setInt('days', days);
  }

  static Future<void> clear(int days) async {
    final perfers = await SharedPreferences.getInstance();
    perfers.clear();
  }
}
