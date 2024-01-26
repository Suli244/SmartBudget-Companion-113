// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:smart_budget_companion_113/screen/infpropril/infpropril.dart';
import 'package:smart_budget_companion_113/screen/smart_budget/smart_budget_screen.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/utils/xzzz/first_open.dart';

class NazhalPeige extends StatefulWidget {
  const NazhalPeige({Key? key}) : super(key: key);

  @override
  State<NazhalPeige> createState() => _NazhalPeigeState();
}

class _NazhalPeigeState extends State<NazhalPeige> {
  @override
  void initState() {
    toStartOnBoar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsSmartBudget.color2C2F42,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.splashLogo,
              width: 232.w,
              height: 232.h,
            ),
          ),
        ],
      ),
    );
  }

  toStartOnBoar() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    final isFirst = await FirstOpenSmartBudget.getFirstOpenSmartBudget();
    if (!isFirst) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const InformatsiyaProPrilozhenie(),
        ),
      );
      await Future.delayed(const Duration(seconds: 8));
      try {
        final InAppReview eenPrilProver = InAppReview.instance;
        if (await eenPrilProver.isAvailable()) {
          eenPrilProver.requestReview();
        }
      } catch (e) {
        throw Exception(e);
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const UmnyiDengiStiklo(),
        ),
      );
    }
  }
}
