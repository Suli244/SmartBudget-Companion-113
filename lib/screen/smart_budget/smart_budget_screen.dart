import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar.dart';

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
            onTap: () {},
            child: Image.asset(
              AppImages.settingsIcon,
              width: 28,
              height: 28,
            ),
          ),
          SizedBox(width: 18.w),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: const Text('Your daily budget - 50\$'),
          ),
          const SizedBox(height: 12),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: const Text('Spendings'),
          ),
        ],
      ),
    );
  }
}
