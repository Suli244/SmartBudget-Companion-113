import 'package:shared_preferences/shared_preferences.dart';

class FirstOpenSmartBudget {
  static Future<bool> getFirstOpenSmartBudget() async {
    final perfers = await SharedPreferences.getInstance();
    return perfers.getBool('isOpened') ?? false;
  }

  static Future<void> setFirstOpenSmartBudget() async {
    final perfers = await SharedPreferences.getInstance();
    perfers.setBool('isOpened', true);
  }
}
