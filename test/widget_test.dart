import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chatgptclone/main.dart';

void main() {
  testWidgets('Home screen shows expected title', (WidgetTester tester) async {
    // Load the main app widget
    await tester.pumpWidget(const MyApp());

    // Verify that the title appears on the home screen
    expect(find.text('QR Code Scanner and Generator'), findsOneWidget);

    // Verify that both buttons are visible
    expect(find.text('Scan QR Code'), findsOneWidget);
    expect(find.text('Generate QR Code'), findsOneWidget);
  });
}
