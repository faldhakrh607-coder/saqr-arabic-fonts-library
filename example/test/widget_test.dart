import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saqr_arabic_fonts_example/main.dart';

void main() {
  testWidgets('demo app shows the font browser', (tester) async {
    await tester.pumpWidget(const SaqrFontsDemoApp());
    await tester.pumpAndSettle();

    expect(find.text('مكتبة صقر للخطوط'), findsOneWidget);
    expect(find.text('Saqr Arabic Fonts Library'), findsWidgets);
    expect(find.text('Cairo'), findsWidgets);
    expect(find.text('العربية'), findsOneWidget);
    expect(find.text('English'), findsWidgets);

    // Poppins is far down the lazy list, so scroll it into view first.
    // The search field adds its own Scrollable, so name the list's one.
    await tester.scrollUntilVisible(
      find.text('Poppins'),
      200,
      scrollable: find.descendant(
        of: find.byType(ListView),
        matching: find.byType(Scrollable),
      ),
    );
    expect(find.text('Poppins'), findsWidgets);
  });

  testWidgets('search filters the font list', (tester) async {
    await tester.pumpWidget(const SaqrFontsDemoApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(EditableText).first, 'Cairo');
    await tester.pumpAndSettle();

    expect(find.text('Cairo'), findsWidgets);
    expect(find.text('Poppins'), findsNothing);
  });

  testWidgets('Arabic filter hides English families', (tester) async {
    await tester.pumpWidget(const SaqrFontsDemoApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('العربية'));
    await tester.pumpAndSettle();

    expect(find.text('Cairo'), findsWidgets);
    expect(find.text('Poppins'), findsNothing);
  });
}
