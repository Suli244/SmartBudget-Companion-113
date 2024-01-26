import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/widgets/spaces_budget.dart';

class NumberConteiner extends StatelessWidget {
  const NumberConteiner({
    super.key,
    required this.onTapNumber,
    required this.number,
    this.flex = 1,
  });

  final Function(String number) onTapNumber;
  final String number;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          onTapNumber(number);
        },
        child: Container(
          alignment: Alignment.center,
          height: 72.h,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.transparent,
            border: Border.all(
              width: 1,
              color: AppColorsSmartBudget.color878FC1.withOpacity(0.5),
            ),
          ),
          child: Text(
            number,
            style: AppTextStylesSmartBudget.s40W700(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
