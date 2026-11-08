import 'package:flutter/widgets.dart';

import 'font_families.dart';

/// The public API of the Saqr Arabic Fonts Library.
///
/// Every method returns a [TextStyle] for one font family. All
/// parameters are optional, so the shortest usage is just the family
/// name:
///
/// ```dart
/// Text('مرحباً بك', style: SaqrFonts.cairo(fontSize: 20)),
/// Text('Welcome', style: SaqrFonts.poppins(fontWeight: FontWeight.bold)),
/// ```
///
/// When [fontWeight] is omitted the Regular (w400) file is used.
/// Passing a weight that has no file for the family falls back to
/// the closest weight Flutter can render, so prefer the weights
/// listed in [SaqrFontFamily.availableWeights].
class SaqrFonts {
  SaqrFonts._();

  /// All ten families, Arabic first, then English.
  static List<SaqrFontFamily> get allFamilies => const [
        SaqrFontFamily.cairo,
        SaqrFontFamily.tajawal,
        SaqrFontFamily.almarai,
        SaqrFontFamily.changa,
        SaqrFontFamily.ibmPlexArabic,
        SaqrFontFamily.notoKufiArabic,
        SaqrFontFamily.roboto,
        SaqrFontFamily.poppins,
        SaqrFontFamily.montserrat,
        SaqrFontFamily.openSans,
      ];

  /// The six Arabic families.
  static List<SaqrFontFamily> get arabicFamilies =>
      allFamilies.where((f) => f.isArabic).toList();

  /// The four English families.
  static List<SaqrFontFamily> get englishFamilies =>
      allFamilies.where((f) => !f.isArabic).toList();

  /// Builds a [TextStyle] for any [family] with the given options.
  /// Every per-family method below calls this one.
  static TextStyle style(
    SaqrFontFamily family, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontFamily: family.familyName,
      package: 'saqr_arabic_fonts',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  /// Cairo. Arabic. Weights 300-900.
  static TextStyle cairo({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.cairo,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// Tajawal. Arabic. Weights 200, 300, 400, 500, 700, 800, 900.
  static TextStyle tajawal({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.tajawal,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// Almarai. Arabic. Weights 300, 400, 700, 800.
  static TextStyle almarai({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.almarai,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// Changa. Arabic. Weights 200-800.
  static TextStyle changa({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.changa,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// IBM Plex Sans Arabic. Arabic. Weights 100-700.
  static TextStyle ibmPlexArabic({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.ibmPlexArabic,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// Noto Kufi Arabic. Arabic. Weights 100-900.
  static TextStyle notoKufiArabic({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.notoKufiArabic,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// Roboto. English. Weights 100, 300-900.
  static TextStyle roboto({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.roboto,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// Poppins. English. Weights 100-900.
  static TextStyle poppins({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.poppins,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// Montserrat. English. Weights 100-900.
  static TextStyle montserrat({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.montserrat,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );

  /// Open Sans. English. Weights 300-800.
  static TextStyle openSans({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) =>
      style(
        SaqrFontFamily.openSans,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontStyle: fontStyle,
      );
}
