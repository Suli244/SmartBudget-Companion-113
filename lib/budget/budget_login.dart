import 'package:dio/dio.dart';
import 'package:smart_budget_companion_113/budget/budget_methods.dart';

Future<String?> budgetLogin({
  required String addPath,
  required String l,
  required String p,
}) async {
  final budgetIsConnected = await budgetIsInternetConnected();
  if (budgetIsConnected) {
    try {
      final serverAuthKeyResponse = await Dio().post(
        addPath,
        data: {"username": l, "password": p},
      );
      if (serverAuthKeyResponse.data != null) {
        return serverAuthKeyResponse.data['access'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  return null;
}
