import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_budget_companion_113/model/hive_helper.dart';
import 'package:smart_budget_companion_113/model/smart_budget_model.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/clear_container_widget.dart';
import 'package:smart_budget_companion_113/screen/daily_budget/widgets/number_container_widget.dart';
import 'package:smart_budget_companion_113/style/app_colors.dart';
import 'package:smart_budget_companion_113/style/app_text_styles.dart';
import 'package:smart_budget_companion_113/utils/image/app_images.dart';
import 'package:smart_budget_companion_113/widgets/custom_app_bar.dart';

class SpendingPage extends StatefulWidget {
  const SpendingPage({super.key});

  @override
  State<SpendingPage> createState() => _SpendingPageState();
}

class _SpendingPageState extends State<SpendingPage> {
  final TextEditingController amountController = TextEditingController();
  ValueNotifier<bool> isHideDot = ValueNotifier<bool>(false);
  final FocusNode _accFocusNode = FocusNode();
  SpendingModel? model;
  @override
  void initState() {
    super.initState();
    _accFocusNode.requestFocus();
    HiveHelper.getBla().then((value) {
      model = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSmartBudget(
        title: 'Daily Budget',
        iconColor: AppColorsSmartBudget.color5D87FF,
        icon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: isHideDot,
            builder: (_, __, child) {
              return IconButton(
                onPressed: () {
                  log('data: model?.amount: ${model?.amount} ');
                  String amountNow = addStrings(
                    model?.amount ?? '0',
                    amountController.text,
                  );
                  final time = DateTime.now();
                  if (isHideDot.value) {
                    final actualModel = SpendingModel(
                      amount: amountNow,
                      date: DateFormat('yyyy-MM-dd').format(time),
                    );
                    Navigator.pop(context, actualModel);
                  }
                },
                icon: Icon(
                  Icons.check,
                  color: isHideDot.value
                      ? AppColorsSmartBudget.color5D87FF
                      : AppColorsSmartBudget.color5D87FF.withOpacity(0.5),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount:',
                    style: AppTextStylesSmartBudget.s16W400(
                      color: AppColorsSmartBudget.color878FC1.withOpacity(0.5),
                    ),
                  ),
                  TextFormField(
                    showCursor: true,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    focusNode: _accFocusNode,
                    style:
                        AppTextStylesSmartBudget.s40W700(color: Colors.white),
                    decoration: InputDecoration(
                      prefix: Text(
                        '\$',
                        style: AppTextStylesSmartBudget.s40W700(
                            color: Colors.white),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColorsSmartBudget.color878FC1,
                          width: 1,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColorsSmartBudget.color878FC1,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Make a budget for yourself so you dont exceed it and balance your income',
                    style: TextStyle(
                      color: Color(0x7F878FC0),
                      fontSize: 16,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: isHideDot,
            builder: (_, __, child) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 32, right: 16, left: 16),
                child: KeyBoardWidgetV2(
                  isAllNorm: true,
                  isDay: !isHideDot.value,
                  onClearOne: () {
                    if (amountController.text.isNotEmpty) {
                      amountController.text = amountController.text
                          .substring(0, amountController.text.length - 1);
                    }
                    inputValidate(
                      textController: amountController,
                      isHideDot: isHideDot,
                    );
                  },
                  onClearAll: () {
                    if (amountController.text.isNotEmpty) {
                      amountController.clear();
                    }
                    inputValidate(
                      textController: amountController,
                      isHideDot: isHideDot,
                    );
                  },
                  onTapNumber: (number) {
                    if (amountController.text.isNotEmpty) {
                      amountController.text += number;
                    } else {
                      amountController.text = number;
                    }
                    inputValidate(
                      textController: amountController,
                      isHideDot: isHideDot,
                    );
                  },
                  onDone: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

String addStrings(String amountNow, String amountLast) {
  double intAmountNow = double.tryParse(amountNow) ?? 0;
  double intAmountLast = double.tryParse(amountLast) ?? 0;
  double result = intAmountNow + intAmountLast;
  String resultString = result.toString();
  return resultString;
}
String minusStrings(String amountNow, String amountLast) {
  double intAmountNow = double.tryParse(amountNow) ?? 0;
  double intAmountLast = double.tryParse(amountLast) ?? 0;
  double result = intAmountNow - intAmountLast;
  String resultString = result.toString();
  return resultString;
}

bool inputValidate({
  required TextEditingController textController,
  required ValueNotifier<bool> isHideDot,
}) {
  final result = double.tryParse(textController.text);
  if (textController.text.isNotEmpty &&
      textController.text[0] != '.' &&
      !textController.text[textController.text.length - 1].contains('.')) {
    if (result != null && result > 0) {
      isHideDot.value = true;
    } else {
      isHideDot.value = false;
    }
  } else {
    isHideDot.value = false;
  }

  return isHideDot.value;
}

class KeyBoardWidgetV2 extends StatelessWidget {
  const KeyBoardWidgetV2({
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
            Expanded(
              flex: 3,
              child: Column(
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
                    ],
                  ),
                  const SizedBox(height: 8),
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
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  ClearConteiner(
                    height: 280.h,
                    onTapClear: onClearOne,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(AppImages.clearIcon),
                    ),
                  ),
                ],
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
            ),
          ],
        ),
      ],
    );
  }
}
