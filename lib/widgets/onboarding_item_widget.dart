import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';

class PokazPrilozheniyaPrimer extends StatelessWidget {
  const PokazPrilozheniyaPrimer({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          width: 400.w,
          height: 840.h,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        Positioned(
          left: 24.w,
          bottom: 149.h,
          child: FittedBox(
            child: Text(
              title,
              style: AppTextStylesSmartBudget.s22W700(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
