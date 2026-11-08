import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:saqr_arabic_fonts/saqr_arabic_fonts.dart';

/// Verifies that every font file declared by the package really exists
/// on disk, is a non-empty TrueType file, and that every family has
/// its SIL Open Font License notice.
void main() {
  test('every declared font file exists and is a real TTF', () {
    var checked = 0;
    for (final family in SaqrFontFamily.values) {
      for (final fileName in family.assetFileNames) {
        final file = File('lib/fonts/$fileName');
        expect(
          file.existsSync(),
          isTrue,
          reason: 'missing font file: lib/fonts/$fileName',
        );
        final bytes = file.readAsBytesSync();
        expect(bytes.length, greaterThan(10000),
            reason: '$fileName looks truncated');
        // TrueType magic: 0x00010000. OpenType CFF would be 'OTTO'.
        final magic = bytes.sublist(0, 4);
        final isTtf = magic[0] == 0x00 &&
            magic[1] == 0x01 &&
            magic[2] == 0x00 &&
            magic[3] == 0x00;
        final isOtf =
            String.fromCharCodes(magic) == 'OTTO';
        expect(isTtf || isOtf, isTrue,
            reason: '$fileName is not a TrueType/OpenType font');
        checked++;
      }
    }
    expect(checked, 73);
  });

  test('declared weights match the shipped files', () {
    for (final family in SaqrFontFamily.values) {
      expect(
        family.assetFileNames.length,
        family.availableWeights.length,
        reason: '${family.familyName}: files and weights disagree',
      );
    }
  });

  test('every family has its OFL license notice', () {
    const licenseFor = <SaqrFontFamily, String>{
      SaqrFontFamily.cairo: 'OFL-Cairo.txt',
      SaqrFontFamily.tajawal: 'OFL-Tajawal.txt',
      SaqrFontFamily.almarai: 'OFL-Almarai.txt',
      SaqrFontFamily.changa: 'OFL-Changa.txt',
      SaqrFontFamily.ibmPlexArabic: 'OFL-IBMPlexSansArabic.txt',
      SaqrFontFamily.notoKufiArabic: 'OFL-NotoKufiArabic.txt',
      SaqrFontFamily.roboto: 'OFL-Roboto.txt',
      SaqrFontFamily.poppins: 'OFL-Poppins.txt',
      SaqrFontFamily.montserrat: 'OFL-Montserrat.txt',
      SaqrFontFamily.openSans: 'OFL-OpenSans.txt',
    };
    for (final entry in licenseFor.entries) {
      final file = File('licenses/${entry.value}');
      expect(file.existsSync(), isTrue,
          reason: 'missing license: licenses/${entry.value}');
      final text = file.readAsStringSync();
      expect(text, contains('SIL OPEN FONT LICENSE'));
    }
  });
}
