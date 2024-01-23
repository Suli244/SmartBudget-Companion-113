import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/widgets/spaces.dart';

class DoneContainerWidget extends StatelessWidget {
  const DoneContainerWidget({super.key, required this.onDone});
  final Function() onDone;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onDone,
        child: Container(
          alignment: Alignment.center,
          height: 152,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColorsSmartBudget.color5D87FF,
            border: Border.all(
              width: 1,
              color: AppColorsSmartBudget.color878FC1.withOpacity(0.5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  AppImages.checkMarkIcon,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}