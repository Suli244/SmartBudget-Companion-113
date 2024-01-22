import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppImages.onboardingOne,
              width: 390.w,
              height: 466.h,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SmartBudget',
                  style: AppTextStylesSmartBudget.s24W700(
                    color: AppColorsSmartBudget.color5AE2A0,
                  ),
                ),
                Text(
                  ' - this is where \nwe spend it right',
                  style: AppTextStylesSmartBudget.s24W700(
                    color: AppColorsSmartBudget.colorWhite,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
