import 'package:flutter/material.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';

class CustomAppBarSmartBudget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarSmartBudget({
    this.title,
    this.icon,
    this.titleWidget,
    this.centerTitle = true,
    this.actions,
    this.iconColor,
    this.backgroundColor,
    Key? key,
    this.titleTextStyle,
  }) : super(key: key);
  final String? title;
  final Widget? icon;
  final Widget? titleWidget;
  final bool centerTitle;
  final List<Widget>? actions;
  final TextStyle? titleTextStyle;
  final Color? iconColor;
  final Color? backgroundColor;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? Text(title ?? ''),
      titleTextStyle: titleTextStyle ??
          AppTextStylesSmartBudget.s21W600(color: Colors.white),
      backgroundColor: backgroundColor ?? AppColorsSmartBudget.color2C2F42,
      elevation: 0,
      centerTitle: centerTitle,
      iconTheme: IconThemeData(
        color: iconColor ?? Colors.white,
      ),
      leading: icon,
      actions: actions,
    );
  }
}
