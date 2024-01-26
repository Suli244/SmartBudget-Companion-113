import 'package:shared_preferences/shared_preferences.dart';

class AmountSmartBudget {
  static Future<int> getAmount() async {
    final perfers = await SharedPreferences.getInstance();
    return perfers.getInt('amount') ?? 1500;
  }

  static Future<void> setAmount(int amount) async {
    final perfers = await SharedPreferences.getInstance();
    perfers.setInt('amount', amount);
  }
}
