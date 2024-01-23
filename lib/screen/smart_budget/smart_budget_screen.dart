import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/daily_budget_screen.dart';
import 'package:smart_budget_companion_113/screen/settings/settings.dart';
import 'package:smart_budget_companion_113/screen/smart_budget/widgets/show_error_dialog.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar.dart';
import 'package:smart_budget_companion_113/widgets/spaces.dart';

class SmartBudgetScreen extends StatelessWidget {
  const SmartBudgetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSmartBudget(
        title: 'Smart budget',
        icon: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 11.w),
          child: InkWell(
            onTap: () {},
            child: Image.asset(
              AppImages.icon,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
            child: Image.asset(
              AppImages.settingsIcon,
              width: 28,
              height: 28,
            ),
          ),
          SizedBox(width: 18.w),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const DailyBudgetScreen(),
                  ),
                );
              },
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  color: AppColorsSmartBudget.color5D87FF,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColorsSmartBudget.color2C2F42,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '\$1 500 for 30 days',
                        style: AppTextStylesSmartBudget.s12W500(
                          color: AppColorsSmartBudget.color5AE2A0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '\$50',
                          style: AppTextStylesSmartBudget.s40W700(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColorsSmartBudget.colorFD5353,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '-\$0',
                            style: AppTextStylesSmartBudget.s16W700(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your daily budget - 50\$',
                      style: AppTextStylesSmartBudget.s20W500(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'By default, we show how much to spend per day to survive on a living wage. You can change your monthly budget by clicking on this box.',
                      style: AppTextStylesSmartBudget.s12W500(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                showErrorDialog(context);
              },
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  color: AppColorsSmartBudget.color5D87FF,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Spendings',
                      style: AppTextStylesSmartBudget.s20W500(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Here you can enter your daily expense. If you exceed your daily expenditure, you will have less money in the following days, so spend it wisely.',
                      style: AppTextStylesSmartBudget.s12W500(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
