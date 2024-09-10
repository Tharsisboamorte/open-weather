import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  static final AppTextStyle _instance = AppTextStyle._();

  static AppTextStyle get instance => _instance;

  /// Headings
  final h1Bold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: "Aeonik",
  );

  final h1SemiBold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: "Aeonik",
  );

  final h2SemiBold = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: "Aeonik",
  );
  final h2Regular = const TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontFamily: "Aeonik",
  );
  final h2Light = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    fontFamily: "Aeonik",
  );
  final h3Regular = const TextStyle(
    fontSize: 10,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontFamily: "Aeonik",
  );
  final h4Light = const TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.w300,
    fontFamily: "Aeonik",
  );

  /// Body
  final body1Medium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: "Aeonik",
  );
  final body1Regular = const TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontFamily: "Aeonik",
  );
  final body2Regular = const TextStyle(
    fontSize: 10,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontFamily: "Aeonik",
  );
  final body2Light = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    fontFamily: "Aeonik",
  );

  final notable = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: "Notable",
  );
}
