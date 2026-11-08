import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saqr_arabic_fonts/saqr_arabic_fonts.dart';

void main() {
  runApp(const SaqrFontsDemoApp());
}

const String arabicSample = 'مرحباً بك في مكتبة صقر للخطوط العربية';
const String englishSample = 'Welcome to Saqr Arabic Fonts Library';

enum FontFilter { all, arabic, english }

String weightLabel(FontWeight weight) {
  const labels = <int, String>{
    100: 'Thin 100',
    200: 'ExtraLight 200',
    300: 'Light 300',
    400: 'Regular 400',
    500: 'Medium 500',
    600: 'SemiBold 600',
    700: 'Bold 700',
    800: 'ExtraBold 800',
    900: 'Black 900',
  };
  return labels[weight.value] ?? 'Regular 400';
}

String usageSnippet(SaqrFontFamily family) {
  final method = {
    SaqrFontFamily.cairo: 'cairo',
    SaqrFontFamily.tajawal: 'tajawal',
    SaqrFontFamily.almarai: 'almarai',
    SaqrFontFamily.changa: 'changa',
    SaqrFontFamily.ibmPlexArabic: 'ibmPlexArabic',
    SaqrFontFamily.notoKufiArabic: 'notoKufiArabic',
    SaqrFontFamily.roboto: 'roboto',
    SaqrFontFamily.poppins: 'poppins',
    SaqrFontFamily.montserrat: 'montserrat',
    SaqrFontFamily.openSans: 'openSans',
  }[family]!;
  return 'Text(\n'
      "  'مرحباً بك في مكتبة صقر للخطوط العربية',\n"
      '  style: SaqrFonts.$method(fontSize: 20, fontWeight: FontWeight.bold),\n'
      ');';
}

class SaqrFontsDemoApp extends StatefulWidget {
  const SaqrFontsDemoApp({super.key});

  @override
  State<SaqrFontsDemoApp> createState() => _SaqrFontsDemoAppState();
}

class _SaqrFontsDemoAppState extends State<SaqrFontsDemoApp> {
  ThemeMode _mode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saqr Arabic Fonts Library',
      debugShowCheckedModeBanner: false,
      themeMode: _mode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: HomePage(
        isDark: _mode == ThemeMode.dark,
        onToggleTheme: () {
          setState(() {
            _mode =
                _mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FontFilter _filter = FontFilter.all;
  String _query = '';
  final Set<SaqrFontFamily> _compare = {};

  List<SaqrFontFamily> get _visible {
    var list = SaqrFonts.allFamilies;
    switch (_filter) {
      case FontFilter.arabic:
        list = SaqrFonts.arabicFamilies;
        break;
      case FontFilter.english:
        list = SaqrFonts.englishFamilies;
        break;
      case FontFilter.all:
        break;
    }
    if (_query.trim().isEmpty) {
      return list;
    }
    final q = _query.trim().toLowerCase();
    return list
        .where((f) => f.familyName.toLowerCase().contains(q))
        .toList();
  }

  void _toggleCompare(SaqrFontFamily family) {
    setState(() {
      if (_compare.contains(family)) {
        _compare.remove(family);
      } else if (_compare.length < 2) {
        _compare.add(family);
      }
    });
  }

  Future<void> _copyUsage(SaqrFontFamily family) async {
    await Clipboard.setData(ClipboardData(text: usageSnippet(family)));
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم نسخ مثال الاستخدام — ${family.displayName}'),
      ),
    );
  }

  void _showCompare() {
    if (_compare.length != 2) {
      return;
    }
    final first = _compare.elementAt(0);
    final second = _compare.elementAt(1);
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('مقارنة الخطوط'),
          content: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _CompareColumn(family: first)),
                const SizedBox(width: 12),
                Expanded(child: _CompareColumn(family: second)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final visible = _visible;
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('مكتبة صقر للخطوط'),
            Text(
              'Saqr Arabic Fonts Library',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: 'تبديل المظهر',
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'ابحث عن خط...  Search fonts',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text('الكل'),
                  selected: _filter == FontFilter.all,
                  onSelected: (_) {
                    setState(() {
                      _filter = FontFilter.all;
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('العربية'),
                  selected: _filter == FontFilter.arabic,
                  onSelected: (_) {
                    setState(() {
                      _filter = FontFilter.arabic;
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('English'),
                  selected: _filter == FontFilter.english,
                  onSelected: (_) {
                    setState(() {
                      _filter = FontFilter.english;
                    });
                  },
                ),
              ],
            ),
          ),
          if (_compare.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'للمقارنة: ${_compare.map((f) => f.displayName).join(' و ')}',
                    ),
                  ),
                  FilledButton(
                    onPressed:
                        _compare.length == 2 ? _showCompare : null,
                    child: const Text('عرض المقارنة'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: visible.isEmpty
                ? const Center(child: Text('لا توجد نتائج مطابقة'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: visible.length,
                    itemBuilder: (context, index) {
                      final family = visible[index];
                      return FontCard(
                        family: family,
                        compareSelected: _compare.contains(family),
                        onToggleCompare: () => _toggleCompare(family),
                        onCopy: () => _copyUsage(family),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class FontCard extends StatelessWidget {
  const FontCard({
    super.key,
    required this.family,
    required this.compareSelected,
    required this.onToggleCompare,
    required this.onCopy,
  });

  final SaqrFontFamily family;
  final bool compareSelected;
  final VoidCallback onToggleCompare;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    family.displayName,
                    style: SaqrFonts.style(
                      family,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Chip(
                  label: Text(family.isArabic ? 'عربي' : 'English'),
                ),
                IconButton(
                  icon: Icon(
                    compareSelected
                        ? Icons.compare_arrows
                        : Icons.compare_arrows_outlined,
                  ),
                  tooltip: 'إضافة للمقارنة',
                  onPressed: onToggleCompare,
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  tooltip: 'نسخ مثال الاستخدام',
                  onPressed: onCopy,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              arabicSample,
              textDirection: TextDirection.rtl,
              style: SaqrFonts.style(
                family,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              englishSample,
              style: SaqrFonts.style(
                family,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            const Text('الأوزان المتوفرة:'),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final weight in family.availableWeights)
                  Chip(
                    label: Text(
                      'مرحباً ${weightLabel(weight)}',
                      style: SaqrFonts.style(
                        family,
                        fontSize: 14,
                        fontWeight: weight,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CompareColumn extends StatelessWidget {
  const _CompareColumn({required this.family});

  final SaqrFontFamily family;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          family.displayName,
          style: SaqrFonts.style(
            family,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          arabicSample,
          textDirection: TextDirection.rtl,
          style: SaqrFonts.style(
            family,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          englishSample,
          style: SaqrFonts.style(
            family,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        for (final weight in [
          FontWeight.w400,
          FontWeight.w700,
        ])
          if (family.availableWeights.contains(weight))
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'مرحباً ${weightLabel(weight)}',
                style: SaqrFonts.style(
                  family,
                  fontSize: 15,
                  fontWeight: weight,
                ),
              ),
            ),
      ],
    );
  }
}
