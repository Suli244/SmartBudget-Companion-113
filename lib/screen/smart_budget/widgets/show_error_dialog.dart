import 'package:flutter/material.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/widgets/custom_button.dart';


showErrorDialog(
  BuildContext context, {
  required int dayly,
  required int spent,
  required int ostatok,
  required String currancy,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      content: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Stack(
              children: [
                Image.asset(AppImages.dialogBgImage),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'You have exceeded the daily limit. Please try to save for today!',
                        textAlign: TextAlign.center,
                        style: AppTextStylesSmartBudget.s20W500(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Image.asset(AppImages.dialogBgLine),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your daily budget',
                            style: AppTextStylesSmartBudget.s16W400(
                              color: AppColorsSmartBudget.color878FC1
                                  .withOpacity(0.5),
                            ),
                          ),
                          Text(
                            '$currancy$dayly',
                            style: AppTextStylesSmartBudget.s16W700(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'You spent',
                            style: AppTextStylesSmartBudget.s16W400(
                              color: AppColorsSmartBudget.color878FC1
                                  .withOpacity(0.5),
                            ),
                          ),
                          Text(
                            '$currancy$spent',
                            style: AppTextStylesSmartBudget.s16W700(
                              color: AppColorsSmartBudget.colorFD5353,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Image.asset(AppImages.dialogBgLine),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '$currancy$ostatok',
                            style: AppTextStylesSmartBudget.s40W700(
                              color: AppColorsSmartBudget.colorFD5353,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomButtonSmartBudget(
            radius: 24,
            color: AppColorsSmartBudget.color5D87FF,
            onPress: () {
              Navigator.pop(context);
            },
            text: 'Ok',
          ),
          const SizedBox(height: 12),
        ],
      ),
    ),
  );
}
