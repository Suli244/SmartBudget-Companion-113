import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:smart_budget_companion_113/screen/onboarding/onboarding_screen.dart';
import 'package:smart_budget_companion_113/screen/smart_budget/smart_budget_screen.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/utils/premium/first_open.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    // final isFirst = await FirstOpenSmartBudget.getFirstOpen();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SmartBudgetScreen(),
      ),
    );

    // if (!isFirst) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const OnboardingScreen(),
    //     ),
    //   );
    //   await Future.delayed(const Duration(seconds: 8));
    //   try {
    //     final InAppReview inAppReview = InAppReview.instance;
    //     if (await inAppReview.isAvailable()) {
    //       inAppReview.requestReview();
    //     }
    //   } catch (e) {
    //     throw Exception(e);
    //   }
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const SmartBudgetScreen(),
    //     ),
    //   );
    // }
  }
}
