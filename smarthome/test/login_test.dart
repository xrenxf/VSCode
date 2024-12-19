import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smarthome/mock/login_page.dart';
// Update with your actual app import

void main() {
  testWidgets('Login Page Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        LoginPage()); // Assuming your main app widget is named MyApp

    // Find the login page
    final loginPageFinder = find.byType(LoginPage);
    expect(loginPageFinder, findsOneWidget);

    // Enter text into email and password fields
    await tester.enterText(find.byType(TextField).first, 'test@email.com');
    await tester.enterText(find.byType(TextField).last, 'password123');

    // Tap the login button
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // You can add assertions here based on the expected behavior after login button press.
    // For example, you might expect a navigation to another screen or a specific message to be displayed.

    // Uncomment the line below to see the widget tree in the console (for debugging purposes).
    // await tester.pumpAndSettle();
  });
}