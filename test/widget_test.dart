// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cursor_ai_play/my_app.dart';

void main() {
  testWidgets('Counter countdown test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 10
    expect(find.text('10'), findsOneWidget);
    expect(find.text('9'), findsNothing);

    // Tap the '-' icon and trigger a frame
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that our counter has decremented to 9
    expect(find.text('10'), findsNothing);
    expect(find.text('9'), findsOneWidget);

    // Test countdown to 0
    for (int i = 9; i > 0; i--) {
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('$i'), findsNothing);
      expect(find.text('${i - 1}'), findsOneWidget);
    }

    // Test reset to 10 after reaching 0
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('0'), findsNothing);
    expect(find.text('10'), findsOneWidget);
  });
}
