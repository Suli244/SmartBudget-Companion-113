import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/model/hive_helper.dart';
import 'package:smart_budget_companion_113/model/smart_budget_model.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/utils/xzzz/amount.dart';
import 'package:smart_budget_companion_113/utils/xzzz/days.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  int middle = 0;

  Future<List<SpendingModel>> getCurrancy() async {
    final days = await DaysSmartBudget.getDays();
    final amount = await AmountSmartBudget.getAmount();
    middle = (amount / days).floor();
    return await HiveHelper.getSpendings();
  }

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
      body: FutureBuilder(
          future: getCurrancy(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: snap.data == null || snap.data!.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            const Spacer(flex: 2),
                            Image.asset(AppImages.statisticsNull),
                            SizedBox(height: 16.h),
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
                        itemCount: snap.data!.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12.h),
                        itemBuilder: (context, index) => Container(
                          height: 118.h,
                          margin: EdgeInsets.only(
                              top: index == 0 ? 16.h : 0,
                              bottom: index == 16.h ? 16.h : 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.h, vertical: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColorsSmartBudget.color5D87FF
                                .withOpacity(0.25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Budget as of ${snap.data![index].date}",
                                style: TextStyle(
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$$middle",
                                    style: TextStyle(
                                        fontSize: 40.h,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(width: 4.w),
                                  Container(
                                    height: 28.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                        color: AppColorsSmartBudget.colorFD5353,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        "-\$${snap.data![index].amount}",
                                        style: TextStyle(
                                          fontSize: 16.h,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  Container(
                                    height: 28.h,
                                    width: 52.w,
                                    decoration: BoxDecoration(
                                        color: AppColorsSmartBudget.color5AE2A0,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        "+\$${middle - snap.data![index].amount < 0 ? 0 : middle - snap.data![index].amount}",
                                        style: TextStyle(
                                          fontSize: 16.h,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
