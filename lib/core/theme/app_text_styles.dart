import 'package:flutter/material.dart';

class AppTextStyles {
  static const String fontFamilyInter = 'Inter';
  static const String fontFamilySFMono = 'SF Mono';

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamilyInter,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle numberLarge = TextStyle(
    fontFamily: fontFamilySFMono,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const TextStyle numberMedium = TextStyle(
    fontFamily: fontFamilySFMono,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const TextStyle numberSmall = TextStyle(
    fontFamily: fontFamilySFMono,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}
