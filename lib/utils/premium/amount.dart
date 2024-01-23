import 'package:shared_preferences/shared_preferences.dart';

class AmountSmartBudget {
  static Future<int> getAmount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('amount') ?? 1500;
  }

  static Future<void> setAmount(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('amount', amount);
  }
}
