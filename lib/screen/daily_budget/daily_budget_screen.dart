import 'package:flutter/material.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/key_board_widget.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/premium/amount.dart';
import 'package:smart_budget_companion_113/utils/premium/days.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar.dart';

class DailyBudgetScreen extends StatefulWidget {
  const DailyBudgetScreen({super.key});

  @override
  State<DailyBudgetScreen> createState() => _DailyBudgetScreenState();
}

class _DailyBudgetScreenState extends State<DailyBudgetScreen> {
  bool amountFocused = false;
  bool daysFocused = false;

  final amountController = TextEditingController();
  final daysController = TextEditingController();

  bool isLess100 = false;
  bool isMore100000 = false;

  bool isDayLess1 = false;
  bool isDayMore45 = false;

  bool get isAllNorm =>
      amountController.text.isNotEmpty &&
      daysController.text.isNotEmpty &&
      !isLess100 &&
      !isMore100000 &&
      !isDayLess1 &&
      !isDayMore45;

  getDefaultData() async {
    final savedAmount = await AmountSmartBudget.getAmount();
    final savedDays = await DaysSmartBudget.getDays();
    amountController.text = formatNumber(savedAmount);
    daysController.text = savedDays.toString();
    setState(() {});
  }

  @override
  void initState() {
    getDefaultData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: amountFocused || daysFocused
          ? AppColorsSmartBudget.colorFocused13161D
          : null,
      appBar: CustomAppBarSmartBudget(
        backgroundColor: amountFocused || daysFocused
            ? AppColorsSmartBudget.colorFocused13161D
            : null,
        title: 'Daily budget',
        iconColor: AppColorsSmartBudget.color5D87FF,
        actions: [
          GestureDetector(
            onTap: () async {
              if (isAllNorm) {
                await AmountSmartBudget.setAmount(
                  int.parse(amountController.text.replaceAll(' ', '')),
                );
                await DaysSmartBudget.setDays(
                  int.parse(daysController.text.replaceAll(' ', '')),
                );
                Navigator.pop(context);
              }
            },
            child: Icon(
              Icons.check,
              color: AppColorsSmartBudget.color878FC1.withOpacity(0.5),
              size: 30,
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            amountFocused
                ? Row(
                    children: [
                      Text(
                        'min \$100',
                        style: AppTextStylesSmartBudget.s16W400(
                          color: isLess100
                              ? AppColorsSmartBudget.colorFD5353
                              : Colors.white,
                        ),
                      ),
                      Text(
                        ', ',
                        style: AppTextStylesSmartBudget.s16W400(
                            color: Colors.white),
                      ),
                      Text(
                        'max \$100 000',
                        style: AppTextStylesSmartBudget.s16W400(
                            color: isMore100000
                                ? AppColorsSmartBudget.colorFD5353
                                : Colors.white),
                      ),
                    ],
                  )
                : Text(
                    'Amount:',
                    style: AppTextStylesSmartBudget.s16W400(
                      color: AppColorsSmartBudget.color878FC1.withOpacity(0.5),
                    ),
                  ),
            FocusScope(
              onFocusChange: (value) {
                amountFocused = value;
                setState(() {});
              },
              child: TextFormField(
                showCursor: true,
                readOnly: true,
                autofocus: amountFocused,
                keyboardType: TextInputType.number,
                controller: amountController,
                style: AppTextStylesSmartBudget.s40W700(
                    color: daysFocused
                        ? Colors.white.withOpacity(0.5)
                        : isLess100 || isMore100000
                            ? AppColorsSmartBudget.colorFD5353
                            : Colors.white),
                decoration: InputDecoration(
                  prefix: Text(
                    '\$',
                    style: AppTextStylesSmartBudget.s40W700(
                        color: daysFocused
                            ? Colors.white.withOpacity(0.5)
                            : isLess100 || isMore100000
                                ? AppColorsSmartBudget.colorFD5353
                                : Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: daysFocused
                          ? Colors.black.withOpacity(0.5)
                          : AppColorsSmartBudget.color878FC1.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            daysFocused
                ? Row(
                    children: [
                      Text(
                        'min 1',
                        style: AppTextStylesSmartBudget.s16W400(
                          color: isDayLess1
                              ? AppColorsSmartBudget.colorFD5353
                              : Colors.white,
                        ),
                      ),
                      Text(
                        ', ',
                        style: AppTextStylesSmartBudget.s16W400(
                            color: Colors.white),
                      ),
                      Text(
                        'max 45',
                        style: AppTextStylesSmartBudget.s16W400(
                            color: isDayMore45
                                ? AppColorsSmartBudget.colorFD5353
                                : Colors.white),
                      ),
                    ],
                  )
                : Text(
                    'Days:',
                    style: AppTextStylesSmartBudget.s16W400(
                      color: AppColorsSmartBudget.color878FC1.withOpacity(0.5),
                    ),
                  ),
            Focus(
              onFocusChange: (value) {
                daysFocused = value;
                setState(() {});
              },
              child: TextFormField(
                showCursor: true,
                readOnly: true,
                autofocus: daysFocused,
                keyboardType: TextInputType.number,
                controller: daysController,
                style: AppTextStylesSmartBudget.s40W700(
                    color: amountFocused
                        ? Colors.white.withOpacity(0.5)
                        : isDayLess1 || isDayMore45
                            ? AppColorsSmartBudget.colorFD5353
                            : Colors.white),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: amountFocused
                          ? Colors.black.withOpacity(0.5)
                          : AppColorsSmartBudget.color878FC1.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              '\$${calculate(amountController.text, daysController.text)} a day',
              style: AppTextStylesSmartBudget.s20W500(
                color: amountFocused || daysFocused
                    ? Colors.white.withOpacity(0.5)
                    : Colors.white,
              ),
            ),
            const SizedBox(height: 22),
            if (amountFocused || daysFocused)
              KeyBoardWidget(
                isDay: daysFocused,
                isAllNorm: isAllNorm,
                onDone: () async {
                  await AmountSmartBudget.setAmount(
                    int.parse(amountController.text.replaceAll(' ', '')),
                  );
                  await DaysSmartBudget.setDays(
                    int.parse(daysController.text.replaceAll(' ', '')),
                  );
                  Navigator.pop(context);
                },
                onClearOne: () {
                  if (amountFocused) {
                    amountController.text = amountController.text
                        .substring(0, amountController.text.length - 1);
                    final value = amountController.text;
                    if (value.isNotEmpty) {
                      final formatted = formatNumber(
                        int.parse(
                          value.replaceAll(' ', ''),
                        ),
                      );
                      if (int.parse(value.replaceAll(' ', '')) < 100) {
                        isLess100 = true;
                        setState(() {});
                      } else if (int.parse(value.replaceAll(' ', '')) >= 100) {
                        isLess100 = false;
                        setState(() {});
                      }
                      if (int.parse(value.replaceAll(' ', '')) > 100000) {
                        isMore100000 = true;
                        setState(() {});
                      } else if (int.parse(value.replaceAll(' ', '')) <=
                          100000) {
                        isMore100000 = false;
                        setState(() {});
                      }

                      amountController.text = formatted.toString();
                    }
                  }
                  if (daysFocused) {
                    daysController.text = daysController.text
                        .substring(0, daysController.text.length - 1);
                    final value = daysController.text;
                    if (value.isNotEmpty) {
                      final day = int.parse(value);
                      if (day < 1) {
                        isDayLess1 = true;
                        setState(() {});
                      } else if (day >= 1) {
                        isDayLess1 = false;
                        setState(() {});
                      }

                      if (day > 45) {
                        isDayMore45 = true;
                        setState(() {});
                      } else if (day <= 45) {
                        isDayMore45 = false;
                        setState(() {});
                      }
                    } else {
                      isDayLess1 = true;
                      setState(() {});
                    }
                  }
                },
                onClearAll: () {
                  if (amountFocused) {
                    amountController.clear();
                    isLess100 = true;
                    isMore100000 = false;
                    setState(() {});
                  }
                  if (daysFocused) {
                    daysController.clear();
                    isDayMore45 = false;
                    isDayLess1 = true;
                    setState(() {});
                  }
                },
                onTapNumber: (number) {
                  if (amountFocused) {
                    amountController.text = '${amountController.text}$number';
                    final value = amountController.text;
                    if (value.isNotEmpty) {
                      final formatted = formatNumber(
                        int.parse(
                          value.replaceAll(' ', ''),
                        ),
                      );
                      if (int.parse(value.replaceAll(' ', '')) < 100) {
                        isLess100 = true;
                        setState(() {});
                      } else if (int.parse(value.replaceAll(' ', '')) >= 100) {
                        isLess100 = false;
                        setState(() {});
                      }
                      if (int.parse(value.replaceAll(' ', '')) > 100000) {
                        isMore100000 = true;
                        setState(() {});
                      } else if (int.parse(value.replaceAll(' ', '')) <=
                          100000) {
                        isMore100000 = false;
                        setState(() {});
                      }

                      amountController.text = formatted.toString();
                    }
                  }
                  if (daysFocused) {
                    daysController.text = '${daysController.text}$number';
                    final value = daysController.text;
                    if (value.isNotEmpty) {
                      final day = int.parse(value);
                      if (day < 1) {
                        isDayLess1 = true;
                        setState(() {});
                      } else if (day >= 1) {
                        isDayLess1 = false;
                        setState(() {});
                      }

                      if (day > 45) {
                        isDayMore45 = true;
                        setState(() {});
                      } else if (day <= 45) {
                        isDayMore45 = false;
                        setState(() {});
                      }
                    } else {
                      isDayLess1 = true;
                      setState(() {});
                    }
                  }
                },
              ),
          ],
        ),
      ),
    );
  }

  String calculate(String amount, String days) {
    double result = 0;
    double amountINT = double.tryParse(amount.replaceAll(' ', '')) ?? 0;
    double daysINT = int.parse(days.isNotEmpty ? days : '0') == 0
        ? 1
        : double.tryParse(days) ?? 1;

    result = amountINT / daysINT;
    return result.ceilToDouble().toInt().toString();
  }
}

String formatNumber(int number) {
  String numberStr = number.toString();
  if (numberStr.length <= 3) {
    return numberStr;
  }
  String formattedNumber = '';
  int count = 0;
  for (int i = numberStr.length - 1; i >= 0; i--) {
    count++;
    formattedNumber = numberStr[i] + formattedNumber;
    if (count == 3 && i > 0) {
      formattedNumber = ' $formattedNumber';
      count = 0;
    }
  }
  return formattedNumber;
}
