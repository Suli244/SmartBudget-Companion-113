import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/screen/smart_budget/smart_budget_screen.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/utils/xzzz/first_open.dart';
import 'package:smart_budget_companion_113/widgets/custom_button.dart';
import 'package:smart_budget_companion_113/widgets/onboarding_item_widget.dart';

class InformatsiyaProPrilozhenie extends StatefulWidget {
  const InformatsiyaProPrilozhenie({super.key});

  @override
  State<InformatsiyaProPrilozhenie> createState() => __InformatsiyaProPrilozhenieStateState();
}

class __InformatsiyaProPrilozhenieStateState extends State<InformatsiyaProPrilozhenie> {
  final PageController controlllier = PageController();
  int cyrrendPagePerem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: controlllier,
            onPageChanged: (value) {
              setState(() {
                cyrrendPagePerem = value;
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
                if (cyrrendPagePerem == 2) {
                  await FirstOpenSmartBudget.setFirstOpenSmartBudget();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SmartBudgetScreen(),
                    ),
                    (protected) => false,
                  );
                } else {
                  controlllier.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              text: cyrrendPagePerem == 2 ? 'Let’s go' : 'Next',
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
