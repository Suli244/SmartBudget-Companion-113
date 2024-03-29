import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/clear_container_widget.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/zdal_veedzhed.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/number_container_widget.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';

class KeiyBoartVeedgad extends StatelessWidget {
  const KeiyBoartVeedgad({
    super.key,
    required this.onClearOne,
    required this.onClearAll,
    required this.onTapNumber,
    required this.onDone,
    this.isAllNorm = false,
    this.isDay = false,
  });
  final Function() onClearOne;
  final Function() onClearAll;
  final Function(String number) onTapNumber;
  final Function() onDone;

  final bool isAllNorm;
  final bool isDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            NomerKonteiner(
              onTapNumber: onTapNumber,
              number: 7.toString(),
            ),
            const SizedBox(width: 8),
            NomerKonteiner(
              onTapNumber: onTapNumber,
              number: 8.toString(),
            ),
            const SizedBox(width: 8),
            NomerKonteiner(
              onTapNumber: onTapNumber,
              number: 9.toString(),
            ),
            const SizedBox(width: 8),
            KartaNazhatiya(
              onTapClear: onClearOne,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(AppImages.clearIcon),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            NomerKonteiner(
              onTapNumber: onTapNumber,
              number: 4.toString(),
            ),
            const SizedBox(width: 8),
            NomerKonteiner(
              onTapNumber: onTapNumber,
              number: 5.toString(),
            ),
            const SizedBox(width: 8),
            NomerKonteiner(
              onTapNumber: onTapNumber,
              number: 6.toString(),
            ),
            const SizedBox(width: 8),
            KartaNazhatiya(
              onTapClear: onClearAll,
              child: Text(
                'C',
                style: AppTextStylesSmartBudget.s40W700(
                  color: AppColorsSmartBudget.colorFD5353,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      NomerKonteiner(
                        onTapNumber: onTapNumber,
                        number: 1.toString(),
                      ),
                      SizedBox(width: 8.w),
                      NomerKonteiner(
                        onTapNumber: onTapNumber,
                        number: 2.toString(),
                      ),
                      SizedBox(width: 8.w),
                      NomerKonteiner(
                        onTapNumber: onTapNumber,
                        number: 3.toString(),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      NomerKonteiner(
                        onTapNumber: onTapNumber,
                        number: 0.toString(),
                        flex: 2,
                      ),
                      if (!isDay)
                        Expanded(
                          child: Builder(builder: (context) {
                            return Row(
                              children: [
                                const SizedBox(width: 8),
                                NomerKonteiner(
                                  onTapNumber: onTapNumber,
                                  number: '.',
                                ),
                              ],
                            );
                          }),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 8.w),
                  ZdalVeedzhed(
                    isAllNorm: isAllNorm,
                    onDone: onDone,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
