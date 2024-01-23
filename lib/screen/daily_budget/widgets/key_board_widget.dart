import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/clear_container_widget.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/done_container_widget.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/number_container_widget.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';

class KeyBoardWidget extends StatelessWidget {
  const KeyBoardWidget({
    super.key,
    required this.onClearOne,
    required this.onClearAll,
    required this.onTapNumber,
    this.isAllNorm = false,
    this.isDay = false,
  });
  final Function() onClearOne;
  final Function() onClearAll;
  final Function(String number) onTapNumber;

  final bool isAllNorm;
  final bool isDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            NumberConteiner(
              onTapNumber: onTapNumber,
              number: 7.toString(),
            ),
            const SizedBox(width: 8),
            NumberConteiner(
              onTapNumber: onTapNumber,
              number: 8.toString(),
            ),
            const SizedBox(width: 8),
            NumberConteiner(
              onTapNumber: onTapNumber,
              number: 9.toString(),
            ),
            const SizedBox(width: 8),
            ClearConteiner(
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
            NumberConteiner(
              onTapNumber: onTapNumber,
              number: 4.toString(),
            ),
            const SizedBox(width: 8),
            NumberConteiner(
              onTapNumber: onTapNumber,
              number: 5.toString(),
            ),
            const SizedBox(width: 8),
            NumberConteiner(
              onTapNumber: onTapNumber,
              number: 6.toString(),
            ),
            const SizedBox(width: 8),
            ClearConteiner(
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
                      NumberConteiner(
                        onTapNumber: onTapNumber,
                        number: 1.toString(),
                      ),
                      const SizedBox(width: 8),
                      NumberConteiner(
                        onTapNumber: onTapNumber,
                        number: 2.toString(),
                      ),
                      const SizedBox(width: 8),
                      NumberConteiner(
                        onTapNumber: onTapNumber,
                        number: 3.toString(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      NumberConteiner(
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
                                NumberConteiner(
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
                  const SizedBox(width: 8),
                  DoneContainerWidget(
                    onDone: () {},
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
