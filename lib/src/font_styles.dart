import 'package:flutter/widgets.dart';

import 'font_families.dart';
import 'saqr_fonts.dart';

/// Ready-made semantic text styles built on the package fonts.
///
/// Each helper takes the family to render with, so the same scale
/// works for Arabic and English text:
///
/// ```dart
/// Text('مرحباً بك', style: SaqrTextStyles.headline(SaqrFontFamily.cairo)),
/// Text('Welcome', style: SaqrTextStyles.body(SaqrFontFamily.poppins)),
/// ```
class SaqrTextStyles {
  SaqrTextStyles._();

  /// Large display headline. Default size 32, bold.
  static TextStyle headline(
    SaqrFontFamily family, {
    double fontSize = 32,
    FontWeight fontWeight = FontWeight.w700,
    Color? color,
    double? height,
  }) =>
      SaqrFonts.style(
        family,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  /// Section title. Default size 22, semi-bold.
  static TextStyle title(
    SaqrFontFamily family, {
    double fontSize = 22,
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
    double? height,
  }) =>
      SaqrFonts.style(
        family,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  /// Subtitle. Default size 18, medium.
  static TextStyle subtitle(
    SaqrFontFamily family, {
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
    double? height,
  }) =>
      SaqrFonts.style(
        family,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  /// Body text. Default size 16, regular.
  static TextStyle body(
    SaqrFontFamily family, {
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? height,
  }) =>
      SaqrFonts.style(
        family,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  /// Small body text. Default size 14, regular.
  static TextStyle bodySmall(
    SaqrFontFamily family, {
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? height,
  }) =>
      SaqrFonts.style(
        family,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );

  /// Caption and labels. Default size 12, medium.
  static TextStyle caption(
    SaqrFontFamily family, {
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
    double? letterSpacing,
    double? height,
  }) =>
      SaqrFonts.style(
        family,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );
}
