

import 'package:flutter/material.dart';

import 'color_styles.dart';

abstract class TextStyles {


  static final humongous = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w800,
    color: ColorStyles.primaryTextColor,
  );

  static final h1 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    color: ColorStyles.primaryTextColor,
  );

  static final body = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: ColorStyles.primaryTextColor,
  );

  static final bodyBold = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
    color: ColorStyles.primaryTextColor,
  );

  static final bodyMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: ColorStyles.primaryTextColor,
  );

  static final smallMedium = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    color: ColorStyles.primaryTextColor,
  );

  static final xSmallMedium = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w700,
    color: ColorStyles.primaryTextColor,
  );

}