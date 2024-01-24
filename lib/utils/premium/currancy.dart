import 'package:shared_preferences/shared_preferences.dart';

class CurrancySmartBudget {
  static Future<String> getCurrancy() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('currancy') ?? '0';
  }

  static Future<void> setCurrancy(String currancy) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('currancy', currancy);
  }
}
