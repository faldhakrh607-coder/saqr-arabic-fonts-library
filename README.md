# Saqr Arabic Fonts Library

A beautiful collection of Arabic and English fonts for Flutter developers, packaged as one reusable Flutter package.

Six Arabic families and four English families, each in several real weights, with a one-line `TextStyle` API. No extra dependencies. Just add the package and write `SaqrFonts.cairo(...)`.

Author: **Saqr Ali**

## Features

- **10 font families** — 6 Arabic, 4 English
- **73 real font files** in weights from Thin (100) to Black (900), taken from the official Google Fonts sources
- **One-line API** — `SaqrFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold)`
- **Customizable** — font size, weight, color, letter spacing, height, decoration, style
- **Semantic styles** — `SaqrTextStyles.headline`, `.title`, `.subtitle`, `.body`, `.bodySmall`, `.caption`
- **Zero dependencies** — only the Flutter SDK
- **Null safe** and covered by unit tests, including a test that verifies every declared font file exists on disk
- **Demo application** in `example/` with light and dark themes, search, Arabic/English filter, weight showcase, font comparison and copyable usage examples

## Font families

| Family | Language | Weights |
| --- | --- | --- |
| Cairo | Arabic | 300, 400, 500, 600, 700, 800, 900 |
| Tajawal | Arabic | 200, 300, 400, 500, 700, 800, 900 |
| Almarai | Arabic | 300, 400, 700, 800 |
| Changa | Arabic | 200, 300, 400, 500, 600, 700, 800 |
| IBM Plex Sans Arabic | Arabic | 100, 200, 300, 400, 500, 600, 700 |
| Noto Kufi Arabic | Arabic | 100, 200, 300, 400, 500, 600, 700, 800, 900 |
| Roboto | English | 100, 300, 400, 500, 600, 700, 800, 900 |
| Poppins | English | 100, 200, 300, 400, 500, 600, 700, 800, 900 |
| Montserrat | English | 100, 200, 300, 400, 500, 600, 700, 800, 900 |
| Open Sans | English | 300, 400, 500, 600, 700, 800 |

Weights follow what each family officially ships. A weight that is not listed has no font file, so it is not faked.

## Installation

This package is not published on pub.dev yet. Add it from GitHub:

```yaml
dependencies:
  saqr_arabic_fonts:
    git:
      url: https://github.com/faldhakrh607-coder/saqr-arabic-fonts-library.git
```

Then run:

```sh
flutter pub get
```

No extra setup is needed. The fonts are bundled with the package, so there is nothing to declare in your own `pubspec.yaml`.

## Usage

Import the package:

```dart
import 'package:saqr_arabic_fonts/saqr_arabic_fonts.dart';
```

Arabic text:

```dart
Text(
  'مرحباً بك في مكتبة صقر للخطوط العربية',
  style: SaqrFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
);

Text(
  'الخط العربي جميل',
  style: SaqrFonts.tajawal(fontSize: 18, color: Colors.teal),
);
```

English text:

```dart
Text(
  'Welcome to Saqr Arabic Fonts Library',
  style: SaqrFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
);

Text(
  'Clean and modern',
  style: SaqrFonts.montserrat(letterSpacing: 1.2),
);
```

Any family, dynamically:

```dart
Text(
  'Hello',
  style: SaqrFonts.style(
    SaqrFontFamily.notoKufiArabic,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.5,
  ),
);
```

Semantic styles:

```dart
Text('عنوان كبير', style: SaqrTextStyles.headline(SaqrFontFamily.cairo));
Text('نص عادي', style: SaqrTextStyles.body(SaqrFontFamily.tajawal));
Text('ملاحظة صغيرة', style: SaqrTextStyles.caption(SaqrFontFamily.almarai));
```

### Available API

| Method | Family |
| --- | --- |
| `SaqrFonts.cairo({...})` | Cairo |
| `SaqrFonts.tajawal({...})` | Tajawal |
| `SaqrFonts.almarai({...})` | Almarai |
| `SaqrFonts.changa({...})` | Changa |
| `SaqrFonts.ibmPlexArabic({...})` | IBM Plex Sans Arabic |
| `SaqrFonts.notoKufiArabic({...})` | Noto Kufi Arabic |
| `SaqrFonts.roboto({...})` | Roboto |
| `SaqrFonts.poppins({...})` | Poppins |
| `SaqrFonts.montserrat({...})` | Montserrat |
| `SaqrFonts.openSans({...})` | Open Sans |
| `SaqrFonts.style(family, {...})` | Any family |

Every method accepts `fontSize`, `fontWeight`, `color`, `letterSpacing`, `height`, `decoration` and `fontStyle`.

Helper lists: `SaqrFonts.allFamilies`, `SaqrFonts.arabicFamilies`, `SaqrFonts.englishFamilies`. Each `SaqrFontFamily` value also exposes `familyName`, `displayName`, `isArabic`, `availableWeights` and `assetFileNames`.

## Demo application

The `example/` folder holds a full Flutter demo app:

- Browse all ten families with Arabic and English sample text
- Search fonts by name
- Filter Arabic / English / all
- See every weight of each family
- Compare two fonts side by side
- Switch between light and dark themes
- Copy the usage code of any font

Run it with:

```sh
cd example
flutter run
```

Sample texts used in the demo:

- Arabic: «مرحباً بك في مكتبة صقر للخطوط العربية»
- English: «Welcome to Saqr Arabic Fonts Library»

## Screenshots

Screenshots are taken from the demo application in `example/`. Run the demo on a device or emulator and capture the font browser, the weight showcase and the comparison view to add them here.

## Tests

```sh
flutter test
```

The suite checks the API (family names, weights, option pass-through, semantic styles) and the shipped files (every declared TTF exists, is a real TrueType file, and every family has its license notice).

```sh
flutter analyze
```

## Project structure

```text
saqr_arabic_fonts/
├── lib/
│   ├── saqr_arabic_fonts.dart
│   ├── src/
│   │   ├── saqr_fonts.dart
│   │   ├── font_families.dart
│   │   └── font_styles.dart
│   └── fonts/            # 73 TTF files
├── licenses/             # SIL OFL notice per family
├── example/              # Demo application
├── test/                 # Unit tests
├── README.md
├── CHANGELOG.md
├── LICENSE               # MIT, package code
├── pubspec.yaml
└── .gitignore
```

## License

The package code is released under the **MIT License** — see `LICENSE`.

The font files are licensed under the **SIL Open Font License 1.1**. Each family keeps its original license notice in `licenses/` (`OFL-<Family>.txt`). The fonts come from the official Google Fonts repository.

## Author

**Saqr Ali** — Cybersecurity and networks student, Sanaa. This package was built to give Arabic Flutter developers a clean, ready-made font library.
