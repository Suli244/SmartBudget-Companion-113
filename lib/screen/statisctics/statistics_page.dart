import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSmartBudget(
        icon: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColorsSmartBudget.color5883FF,
          ),
        ),
        title: 'Statistics',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: false
            ? Center(
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    Image.asset(AppImages.statisticsNull),
                    const SizedBox(height: 16),
                    Text("It looks like you don't have any records yet",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColorsSmartBudget.color878FC1
                                .withOpacity(0.5))),
                    const Spacer(flex: 3),
                  ],
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                itemCount: 16,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) => Container(
                  height: 108.h,
                  margin: EdgeInsets.only(
                      top: index == 0 ? 16 : 0, bottom: index == 16 ? 16 : 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color:
                          AppColorsSmartBudget.color5D87FF.withOpacity(0.25)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Budget as of 17.01:",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("\$48",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          const SizedBox(width: 4),
                          Container(
                            height: 28.h,
                            width: 52.w,
                            decoration: BoxDecoration(
                                color: AppColorsSmartBudget.colorFD5353,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text("-\$30",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            height: 28.h,
                            width: 52.w,
                            decoration: BoxDecoration(
                                color: AppColorsSmartBudget.color5AE2A0,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text("-\$30",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
