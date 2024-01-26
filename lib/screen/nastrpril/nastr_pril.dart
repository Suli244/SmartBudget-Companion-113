import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/xzzz/currancy.dart';
import 'package:smart_budget_companion_113/utils/urls.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar_widget.dart';
import 'package:smart_budget_companion_113/widgets/custom_button.dart';
import 'package:smart_budget_companion_113/widgets/settings_item_widget.dart';
import 'package:smart_budget_companion_113/widgets/web_view_news.dart';

class NastrPril extends StatefulWidget {
  const NastrPril({super.key});

  @override
  State<NastrPril> createState() => _NastrPrilState();
}

class _NastrPrilState extends State<NastrPril> {
  String currancy = '';

  getCurrancy() async {
    currancy = await CurrancySmartBudget.getCurrancy();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getCurrancy();
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
        title: 'Settings',
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomButtonSmartBudget(
                  color: currancy == '\$'
                      ? AppColorsSmartBudget.color5883FF
                      : AppColorsSmartBudget.color2C2F42,
                  onPress: () {
                    currancy = '\$';
                    setState(() {});
                    CurrancySmartBudget.setCurrancy('\$');
                  },
                  text: 'USD',
                  width: 160.w,
                  height: 53,
                  radius: 24,
                  colorBorder: AppColorsSmartBudget.color5883FF,
                  widthBorder: 2,
                  textStyle: AppTextStylesSmartBudget.s16W600(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                CustomButtonSmartBudget(
                  color: currancy == '€'
                      ? AppColorsSmartBudget.color5883FF
                      : AppColorsSmartBudget.color2C2F42,
                  colorBorder: AppColorsSmartBudget.color5883FF,
                  widthBorder: 2,
                  onPress: () {
                    currancy = '€';
                    setState(() {});
                    CurrancySmartBudget.setCurrancy('€');
                  },
                  text: 'EUR',
                  width: 160.w,
                  height: 53,
                  radius: 24,
                  textStyle: AppTextStylesSmartBudget.s16W600(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SettingsItemwidget(
              title: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebBlueScopeNews(
                      title: 'Privacy policy',
                      url: DocFFSmartBudget.prPol,
                    ),
                  ),
                );
              },
              top: 14,
            ),
            SettingsItemwidget(
              title: 'Terms of Use',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebBlueScopeNews(
                      title: 'Terms of use',
                      url: DocFFSmartBudget.terUse,
                    ),
                  ),
                );
              },
              top: 14,
            ),
            SettingsItemwidget(
              title: 'Support',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebBlueScopeNews(
                      title: 'Support',
                      url: DocFFSmartBudget.supporto,
                    ),
                  ),
                );
              },
              top: 14,
            ),
          ],
        ),
      ),
    );
  }
}
