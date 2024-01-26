import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/widgets/spaces_budget.dart';

class DoneContainerWidget extends StatelessWidget {
  const DoneContainerWidget({
    super.key,
    required this.onDone,
    required this.isAllNorm,
    this.child,
  });
  final Function() onDone;
  final bool isAllNorm;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: isAllNorm ? onDone : null,
        child: Container(
          alignment: Alignment.center,
          height: 152.h,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: child != null
                ? Colors.transparent
                : isAllNorm
                    ? AppColorsSmartBudget.color5D87FF
                    : AppColorsSmartBudget.color878FC1.withOpacity(0.5),
            border: Border.all(
              width: 1,
              color: AppColorsSmartBudget.color878FC1.withOpacity(0.5),
            ),
          ),
          child: child ??
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      AppImages.checkMarkIcon,
                      color: isAllNorm
                          ? Colors.white
                          : AppColorsSmartBudget.color878FC1.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
