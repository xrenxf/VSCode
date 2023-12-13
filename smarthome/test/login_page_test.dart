import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smarthome/homepage/log_reg_page/login_page.dart';

class MockFunction extends Mock {
  void call();
}

void main() {
  group('LoginPage Tests', () {
    testWidgets('Renders LoginPage Widget', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(onTap: MockFunction()),
        ),
      );

      // Verify that the text "SMART HOME" appears on the screen.
      expect(find.text('SMART HOME'), findsOneWidget);
    });

    testWidgets('Tap on Login Button Calls Login Method', (WidgetTester tester) async {
      final mockFunction = MockFunction();

      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(onTap: mockFunction),
        ),
      );

      // Tap on the login button
      await tester.tap(find.text('Login'));
      await tester.pump();

      // Verify that the login method is called
      verify(mockFunction.call()).called(1);
    });

    testWidgets('Tap on Register Here Calls onTap', (WidgetTester tester) async {
      final mockFunction = MockFunction();

      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(onTap: mockFunction),
        ),
      );

      // Tap on the "Register Here" text
      await tester.tap(find.text('Register Here'));
      await tester.pump();

      // Verify that the onTap function is called
      verify(mockFunction.call()).called(1);
    });

    // Add more tests as needed
  });
}
