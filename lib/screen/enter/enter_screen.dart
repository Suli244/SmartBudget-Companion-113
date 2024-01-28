// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/budget/budget_low.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';

class NazhalPeige extends StatefulWidget {
  const NazhalPeige({Key? key}) : super(key: key);

  @override
  State<NazhalPeige> createState() => _NazhalPeigeState();
}

class _NazhalPeigeState extends State<NazhalPeige> {
  @override
  void initState() {
    budgetLow(context);
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
}
