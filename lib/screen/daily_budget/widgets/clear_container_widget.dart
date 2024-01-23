import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/widgets/spaces.dart';

class ClearConteiner extends StatelessWidget {
  const ClearConteiner({
    super.key,
    required this.onTapClear,
    required this.child,
  });

  final Function() onTapClear;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTapClear,
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.transparent,
            border: Border.all(
              width: 1,
              color: AppColorsSmartBudget.color878FC1.withOpacity(0.5),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
