import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saqr_arabic_fonts/saqr_arabic_fonts.dart';

void main() {
  group('SaqrFontFamily', () {
    test('has ten families, six Arabic and four English', () {
      expect(SaqrFontFamily.values.length, 10);
      expect(SaqrFonts.arabicFamilies.length, 6);
      expect(SaqrFonts.englishFamilies.length, 4);
      expect(SaqrFonts.allFamilies.length, 10);
    });

    test('every family has a non-empty family name', () {
      for (final family in SaqrFontFamily.values) {
        expect(family.familyName, isNotEmpty);
        expect(family.displayName, family.familyName);
      }
    });

    test('family names are unique', () {
      final names =
          SaqrFontFamily.values.map((f) => f.familyName).toList();
      expect(names.toSet().length, names.length);
    });

    test('every family lists at least Regular and Bold weights', () {
      for (final family in SaqrFontFamily.values) {
        expect(
          family.availableWeights,
          contains(FontWeight.w400),
          reason: '${family.familyName} has no Regular weight',
        );
        expect(
          family.availableWeights,
          contains(FontWeight.w700),
          reason: '${family.familyName} has no Bold weight',
        );
      }
    });

    test('available weights are sorted ascending', () {
      for (final family in SaqrFontFamily.values) {
        final weights = family.availableWeights;
        for (var i = 1; i < weights.length; i++) {
          expect(weights[i].value, greaterThan(weights[i - 1].value));
        }
      }
    });
  });

  group('SaqrFonts', () {
    test('each family method returns its family name', () {
      // TextStyle folds the package into the family name as
      // 'packages/<package>/<family>'.
      final byMethod = <TextStyle, String>{
        SaqrFonts.cairo(): 'Cairo',
        SaqrFonts.tajawal(): 'Tajawal',
        SaqrFonts.almarai(): 'Almarai',
        SaqrFonts.changa(): 'Changa',
        SaqrFonts.ibmPlexArabic(): 'IBM Plex Sans Arabic',
        SaqrFonts.notoKufiArabic(): 'Noto Kufi Arabic',
        SaqrFonts.roboto(): 'Roboto',
        SaqrFonts.poppins(): 'Poppins',
        SaqrFonts.montserrat(): 'Montserrat',
        SaqrFonts.openSans(): 'Open Sans',
      };
      for (final entry in byMethod.entries) {
        expect(
          entry.key.fontFamily,
          'packages/saqr_arabic_fonts/${entry.value}',
        );
      }
    });

    test('style() matches the per-family methods', () {
      expect(
        SaqrFonts.style(SaqrFontFamily.cairo, fontSize: 18),
        SaqrFonts.cairo(fontSize: 18),
      );
      expect(
        SaqrFonts.style(
          SaqrFontFamily.poppins,
          fontWeight: FontWeight.w700,
        ),
        SaqrFonts.poppins(fontWeight: FontWeight.w700),
      );
    });

    test('customization options pass through', () {
      const color = Color(0xFF112233);
      final style = SaqrFonts.cairo(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 1.5,
        height: 1.6,
      );
      expect(style.fontSize, 20);
      expect(style.fontWeight, FontWeight.w600);
      expect(style.color, color);
      expect(style.letterSpacing, 1.5);
      expect(style.height, 1.6);
    });

    test('omitted options stay null', () {
      final style = SaqrFonts.tajawal();
      expect(style.fontSize, isNull);
      expect(style.fontWeight, isNull);
      expect(style.color, isNull);
      expect(style.letterSpacing, isNull);
      expect(style.height, isNull);
    });
  });

  group('SaqrTextStyles', () {
    test('semantic styles use the given family with sane defaults', () {
      final headline = SaqrTextStyles.headline(SaqrFontFamily.cairo);
      expect(headline.fontFamily, 'packages/saqr_arabic_fonts/Cairo');
      expect(headline.fontSize, 32);
      expect(headline.fontWeight, FontWeight.w700);

      final body = SaqrTextStyles.body(SaqrFontFamily.poppins);
      expect(body.fontFamily, 'packages/saqr_arabic_fonts/Poppins');
      expect(body.fontSize, 16);
      expect(body.fontWeight, FontWeight.w400);

      final caption = SaqrTextStyles.caption(SaqrFontFamily.almarai);
      expect(caption.fontFamily, 'packages/saqr_arabic_fonts/Almarai');
      expect(caption.fontSize, 12);
    });

    test('semantic style options override the defaults', () {
      final title = SaqrTextStyles.title(
        SaqrFontFamily.changa,
        fontSize: 30,
        fontWeight: FontWeight.w800,
      );
      expect(title.fontSize, 30);
      expect(title.fontWeight, FontWeight.w800);
    });
  });
}
