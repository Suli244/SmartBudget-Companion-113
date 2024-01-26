import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/screen/smart_budget/smart_budget_screen.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/utils/xzzz/first_open.dart';
import 'package:smart_budget_companion_113/widgets/custom_button.dart';
import 'package:smart_budget_companion_113/widgets/onboarding_item_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                currantPage = value;
              });
            },
            children: const [
              OnboardingItemWidget(
                title: 'Track your budget with\nconvinient interface',
                image: AppImages.onboardingOne,
              ),
              OnboardingItemWidget(
                title:
                    'Save the amount you need in\norder to achieve your goals',
                image: AppImages.onboardingTwo,
              ),
              OnboardingItemWidget(
                title:
                    'Seize financial freedom\neffortlessly. Get started now!',
                image: AppImages.onboardingTrhee,
              ),
            ],
          ),
          Positioned(
            left: 24.w,
            right: 24.w,
            bottom: 57.h,
            child: CustomButtonSmartBudget(
              color: AppColorsSmartBudget.color5883FF,
              onPress: () async {
                if (currantPage == 2) {
                  await FirstOpenSmartBudget.setFirstOpenSmartBudget();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SmartBudgetScreen(),
                    ),
                    (protected) => false,
                  );
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              text: currantPage == 2 ? 'Let’s go' : 'Next',
              radius: 24,
              height: 54,
              textStyle: AppTextStylesSmartBudget.s17Wbold(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
