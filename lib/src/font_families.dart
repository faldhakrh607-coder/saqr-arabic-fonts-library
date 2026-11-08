import 'package:flutter/widgets.dart';

/// Every font family shipped by the package.
///
/// Each value knows its Flutter family name, whether it is an Arabic
/// family, and which [FontWeight] values have a real font file behind
/// them. A weight that is not listed here has no file in the package,
/// so Flutter would have to synthesize it.
enum SaqrFontFamily {
  cairo,
  tajawal,
  almarai,
  changa,
  ibmPlexArabic,
  notoKufiArabic,
  roboto,
  poppins,
  montserrat,
  openSans;

  /// The family name declared in the package `pubspec.yaml`.
  String get familyName {
    switch (this) {
      case SaqrFontFamily.cairo:
        return 'Cairo';
      case SaqrFontFamily.tajawal:
        return 'Tajawal';
      case SaqrFontFamily.almarai:
        return 'Almarai';
      case SaqrFontFamily.changa:
        return 'Changa';
      case SaqrFontFamily.ibmPlexArabic:
        return 'IBM Plex Sans Arabic';
      case SaqrFontFamily.notoKufiArabic:
        return 'Noto Kufi Arabic';
      case SaqrFontFamily.roboto:
        return 'Roboto';
      case SaqrFontFamily.poppins:
        return 'Poppins';
      case SaqrFontFamily.montserrat:
        return 'Montserrat';
      case SaqrFontFamily.openSans:
        return 'Open Sans';
    }
  }

  /// Human readable name shown in the demo application.
  String get displayName => familyName;

  /// True for the six Arabic families, false for the four English ones.
  bool get isArabic {
    switch (this) {
      case SaqrFontFamily.cairo:
      case SaqrFontFamily.tajawal:
      case SaqrFontFamily.almarai:
      case SaqrFontFamily.changa:
      case SaqrFontFamily.ibmPlexArabic:
      case SaqrFontFamily.notoKufiArabic:
        return true;
      case SaqrFontFamily.roboto:
      case SaqrFontFamily.poppins:
      case SaqrFontFamily.montserrat:
      case SaqrFontFamily.openSans:
        return false;
    }
  }

  /// The weights that really exist as font files for this family.
  List<FontWeight> get availableWeights {
    switch (this) {
      case SaqrFontFamily.cairo:
        return const [
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w600,
          FontWeight.w700,
          FontWeight.w800,
          FontWeight.w900,
        ];
      case SaqrFontFamily.tajawal:
        return const [
          FontWeight.w200,
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w700,
          FontWeight.w800,
          FontWeight.w900,
        ];
      case SaqrFontFamily.almarai:
        return const [
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w700,
          FontWeight.w800,
        ];
      case SaqrFontFamily.changa:
        return const [
          FontWeight.w200,
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w600,
          FontWeight.w700,
          FontWeight.w800,
        ];
      case SaqrFontFamily.ibmPlexArabic:
        return const [
          FontWeight.w100,
          FontWeight.w200,
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w600,
          FontWeight.w700,
        ];
      case SaqrFontFamily.notoKufiArabic:
        return const [
          FontWeight.w100,
          FontWeight.w200,
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w600,
          FontWeight.w700,
          FontWeight.w800,
          FontWeight.w900,
        ];
      case SaqrFontFamily.roboto:
        return const [
          FontWeight.w100,
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w600,
          FontWeight.w700,
          FontWeight.w800,
          FontWeight.w900,
        ];
      case SaqrFontFamily.poppins:
      case SaqrFontFamily.montserrat:
        return const [
          FontWeight.w100,
          FontWeight.w200,
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w600,
          FontWeight.w700,
          FontWeight.w800,
          FontWeight.w900,
        ];
      case SaqrFontFamily.openSans:
        return const [
          FontWeight.w300,
          FontWeight.w400,
          FontWeight.w500,
          FontWeight.w600,
          FontWeight.w700,
          FontWeight.w800,
        ];
    }
  }

  /// File names shipped in `lib/fonts` for this family.
  List<String> get assetFileNames {
    const fileNames = <SaqrFontFamily, List<String>>{
      SaqrFontFamily.cairo: [
        'Cairo-Light.ttf',
        'Cairo-Regular.ttf',
        'Cairo-Medium.ttf',
        'Cairo-SemiBold.ttf',
        'Cairo-Bold.ttf',
        'Cairo-ExtraBold.ttf',
        'Cairo-Black.ttf',
      ],
      SaqrFontFamily.tajawal: [
        'Tajawal-ExtraLight.ttf',
        'Tajawal-Light.ttf',
        'Tajawal-Regular.ttf',
        'Tajawal-Medium.ttf',
        'Tajawal-Bold.ttf',
        'Tajawal-ExtraBold.ttf',
        'Tajawal-Black.ttf',
      ],
      SaqrFontFamily.almarai: [
        'Almarai-Light.ttf',
        'Almarai-Regular.ttf',
        'Almarai-Bold.ttf',
        'Almarai-ExtraBold.ttf',
      ],
      SaqrFontFamily.changa: [
        'Changa-ExtraLight.ttf',
        'Changa-Light.ttf',
        'Changa-Regular.ttf',
        'Changa-Medium.ttf',
        'Changa-SemiBold.ttf',
        'Changa-Bold.ttf',
        'Changa-ExtraBold.ttf',
      ],
      SaqrFontFamily.ibmPlexArabic: [
        'IBMPlexSansArabic-Thin.ttf',
        'IBMPlexSansArabic-ExtraLight.ttf',
        'IBMPlexSansArabic-Light.ttf',
        'IBMPlexSansArabic-Regular.ttf',
        'IBMPlexSansArabic-Medium.ttf',
        'IBMPlexSansArabic-SemiBold.ttf',
        'IBMPlexSansArabic-Bold.ttf',
      ],
      SaqrFontFamily.notoKufiArabic: [
        'NotoKufiArabic-Thin.ttf',
        'NotoKufiArabic-ExtraLight.ttf',
        'NotoKufiArabic-Light.ttf',
        'NotoKufiArabic-Regular.ttf',
        'NotoKufiArabic-Medium.ttf',
        'NotoKufiArabic-SemiBold.ttf',
        'NotoKufiArabic-Bold.ttf',
        'NotoKufiArabic-ExtraBold.ttf',
        'NotoKufiArabic-Black.ttf',
      ],
      SaqrFontFamily.roboto: [
        'Roboto-Thin.ttf',
        'Roboto-Light.ttf',
        'Roboto-Regular.ttf',
        'Roboto-Medium.ttf',
        'Roboto-SemiBold.ttf',
        'Roboto-Bold.ttf',
        'Roboto-ExtraBold.ttf',
        'Roboto-Black.ttf',
      ],
      SaqrFontFamily.poppins: [
        'Poppins-Thin.ttf',
        'Poppins-ExtraLight.ttf',
        'Poppins-Light.ttf',
        'Poppins-Regular.ttf',
        'Poppins-Medium.ttf',
        'Poppins-SemiBold.ttf',
        'Poppins-Bold.ttf',
        'Poppins-ExtraBold.ttf',
        'Poppins-Black.ttf',
      ],
      SaqrFontFamily.montserrat: [
        'Montserrat-Thin.ttf',
        'Montserrat-ExtraLight.ttf',
        'Montserrat-Light.ttf',
        'Montserrat-Regular.ttf',
        'Montserrat-Medium.ttf',
        'Montserrat-SemiBold.ttf',
        'Montserrat-Bold.ttf',
        'Montserrat-ExtraBold.ttf',
        'Montserrat-Black.ttf',
      ],
      SaqrFontFamily.openSans: [
        'OpenSans-Light.ttf',
        'OpenSans-Regular.ttf',
        'OpenSans-Medium.ttf',
        'OpenSans-SemiBold.ttf',
        'OpenSans-Bold.ttf',
        'OpenSans-ExtraBold.ttf',
      ],
    };
    return fileNames[this]!;
  }
}
