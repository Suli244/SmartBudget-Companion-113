import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/model/hive_helper.dart';
import 'package:smart_budget_companion_113/model/smart_budget_model.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/daily_budget_screen.dart';
import 'package:smart_budget_companion_113/screen/settings/settings.dart';
import 'package:smart_budget_companion_113/screen/smart_budget/widgets/show_error_dialog.dart';
import 'package:smart_budget_companion_113/screen/statisctics/statistics_page.dart';
import 'package:smart_budget_companion_113/screen/smart_budget/widgets/show_success_dialog.dart';
import 'package:smart_budget_companion_113/screen/spendings/spendings_page.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/date_format.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/utils/premium/amount.dart';
import 'package:smart_budget_companion_113/utils/premium/currancy.dart';
import 'package:smart_budget_companion_113/utils/premium/days.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar.dart';
import 'package:smart_budget_companion_113/widgets/spaces.dart';

class SmartBudgetScreen extends StatefulWidget {
  const SmartBudgetScreen({super.key});

  @override
  State<SmartBudgetScreen> createState() => _SmartBudgetScreenState();
}

class _SmartBudgetScreenState extends State<SmartBudgetScreen> {
  String currancy = '';
  int days = 0;
  int amount = 0;
  List<SpendingModel> spendings = [];

  Future<void> getCurrancy() async {
    currancy = await CurrancySmartBudget.getCurrancy();
    days = await DaysSmartBudget.getDays();
    amount = await AmountSmartBudget.getAmount();
    await getSpandings();
    setState(() {});
  }

  getSpandings() async {
    spendings.clear();
    spendings = await HiveHelper.getSpendings();
  }

  @override
  void initState() {
    getCurrancy().then((value) => showDialg());
    super.initState();
  }

  showDialg() async {
    if (spendings.isNotEmpty) {
      if (spendings.last.date ==
          AppDateFromat.dateFormat.format(DateTime.now())) {
        if (ostatokAmount() < 0) {
          showErrorDialog(
            context,
            dayly: daylyAmoint(),
            spent: amountForToDay(),
            ostatok: ostatokAmount(),
            currancy: currancy,
          );
        } else {
          showSuccessDialog(
            context,
            dayly: daylyAmoint(),
            spent: amountForToDay(),
            ostatok: ostatokAmount(),
            currancy: currancy,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSmartBudget(
        title: 'Smart budget',
        icon: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 11.w),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StatisticsPage()));
            },
            child: Image.asset(
              AppImages.icon,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
              await getCurrancy();
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
              onTap: () async {
                await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const DailyBudgetScreen(),
                  ),
                );
                await getCurrancy();
              },
              child: Container(
                width: context.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: AssetImage(
                      AppImages.cardBgImage,
                    ),
                    fit: BoxFit.cover,
                  ),
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
                        '$currancy${totalAmount()} for ${totalDays()} days',
                        style: AppTextStylesSmartBudget.s12W500(
                          color: AppColorsSmartBudget.color5AE2A0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '$currancy${ostatokAmount()}',
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
                            '$currancy${amountForToDay() > 0 ? '-${amountForToDay()}' : '0'}',
                            style: AppTextStylesSmartBudget.s16W700(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your daily budget - $currancy${daylyAmoint()}',
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
              onTap: () async {
                final model = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SpendingPage()),
                ) as SpendingModel?;

                if (model != null) {
                  await HiveHelper.addSpending(model);
                  await getCurrancy();
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBar(model),
                  );
                }
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

  SnackBar snackBar(SpendingModel model) => SnackBar(
        duration: const Duration(seconds: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: const EdgeInsets.only(
          bottom: 50,
          right: 20,
          left: 20,
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            Image.asset(
              AppImages.walletIcon,
              scale: 4,
            ),
            const SizedBox(width: 12),
            Text(
              'Your expense added',
              style: AppTextStylesSmartBudget.s16W400(),
            ),
          ],
        ),
        action: SnackBarAction(
          textColor: const Color(0xff5883FF),
          label: 'Undo',
          onPressed: () async {
            await HiveHelper.removeSpending(model);
            setState(() {});
          },
        ),
      );

  int totalAmount() {
    int savedAmount = 0;
    for (var e in spendings) {
      savedAmount += e.amount;
    }
    return amount - savedAmount;
  }

  int totalDays() {
    int savedDays = 0;
    if (spendings.isNotEmpty) {
      if (spendings.last.date ==
          AppDateFromat.dateFormat.format(DateTime.now())) {
        savedDays = days - spendings.length + 1;
      } else {
        savedDays = days - spendings.length;
      }
    }
    return savedDays;
  }

  int daylyAmoint() {
    return (totalAmount() / (totalDays() == 0 ? 1 : totalDays())).floor();
  }

  int amountForToDay() {
    int amountForToDay = 0;
    if (spendings.isNotEmpty) {
      if (spendings.last.date ==
          AppDateFromat.dateFormat.format(DateTime.now())) {
        amountForToDay = spendings.last.amount;
      }
    }
    return amountForToDay;
  }

  int ostatokAmount() {
    return daylyAmoint() - amountForToDay();
  }
}

class HellShow {
  double dailyBudget;
  double spent;
  HellShow({
    required this.dailyBudget,
    required this.spent,
  });
}
