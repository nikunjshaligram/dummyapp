// ignore_for_file: unused_field

import 'dart:io';

import 'package:flutter/material.dart';

class AppStyle {
  static const String _monBoldFamily = "MonBold";
  static const String _monExtraBoldFamily = "MonExtraBold";
  static const String _monItalicFamily = "MonItalic";
  static const String _monLightFamily = "MonLight";
  static const String _monMediumFamily = "MonMedium";
  static const String _monSemiBoldFamily = "MonSemiBold";
  static const String _monRegularFamily = "MonRegular";

  static TextStyle regularTextStyle(
      {Color color = const Color(0xFF1F0039),
      required double size,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        fontFamily: _monRegularFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        height: 1.2);
  }

  static TextStyle mediumTextStyle(
      {Color color = const Color(0xFF1F0039),
      required double size,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        fontFamily: _monMediumFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        height: 1.2);
  }

  static TextStyle semiBoldTextStyle(
      {Color color = const Color(0xFF1F0039),
      required double size,
      FontWeight fontWeight = FontWeight.w600}) {
    return TextStyle(
        fontFamily: _monSemiBoldFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        height: 1.2);
  }

  static TextStyle boldTextStyle(
      {Color color = const Color(0xFF929DAA),
      required double size,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
        fontFamily: _monBoldFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight);
  }

  static EdgeInsets iosPadding =
      EdgeInsets.only(bottom: (Platform.isIOS) ? 10 : 0);
  static EdgeInsets androidPadding =
      EdgeInsets.only(top: (Platform.isAndroid) ? 10 : 0);
  static double androidSpacing = (Platform.isAndroid) ? 10 : 0;
  static double iosSpacing = (Platform.isIOS) ? 10 : 0;
}
