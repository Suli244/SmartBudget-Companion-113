import 'package:shared_preferences/shared_preferences.dart';

class CurrancySmartBudget {
  static Future<String> getCurrancy() async {
    final perfers = await SharedPreferences.getInstance();
    return perfers.getString('currancy') ?? '\$';
  }

  static Future<void> setCurrancy(String currancy) async {
    final perfers = await SharedPreferences.getInstance();
    perfers.setString('currancy', currancy);
  }
}
