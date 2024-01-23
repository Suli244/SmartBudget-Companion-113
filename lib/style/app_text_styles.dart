import 'package:flutter/material.dart';

const fonst = 'Gilroy-Medium';

abstract class AppTextStylesSmartBudget {
  static TextStyle s10Wbold({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
  static TextStyle s23W600({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 23,
        fontWeight: FontWeight.w600,
      );
  static TextStyle s21W600({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 21,
        fontWeight: FontWeight.w600,
      );
  static TextStyle s17W600({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );
  static TextStyle s23W800({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w800,
      );
  static TextStyle s24W700({Color? color, String? fontFamily}) => TextStyle(
        fontFamily: fontFamily ?? fonst,
        color: color ?? Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s15W700({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s16W700({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s12W500({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );
  static TextStyle s20W500({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static TextStyle s40W700({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s16W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
}
