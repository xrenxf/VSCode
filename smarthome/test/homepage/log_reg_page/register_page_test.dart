import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smarthome/homepage/log_reg_page/register_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
class MockFunctionCallback extends Mock {void call();}

void main() {
  testWidgets('Register Page UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RegisterPage(
          onTap: () {},
        ),
      ),
    );

    // Verify that the app has the correct UI elements.
    expect(find.text('SMART HOME'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
    expect(find.text("Already have an account? "), findsOneWidget);
    expect(find.text('Login Here'), findsOneWidget);
  });

  group('RegisterPage Widget Tests', () {
    late MockFunctionCallback mockCallback;

    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
    });

    setUp(() {
      mockCallback = MockFunctionCallback();
    });

    testWidgets('Register Page - Passwords Match', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: RegisterPage(
            onTap: mockCallback,
          ),
          navigatorObservers: [mockObserver],
        ),
      );

      await tester.enterText(find.byType(TextField).at(0), 'testUsername');
      await tester.enterText(find.byType(TextField).at(1), 'test@example.com');
      await tester.enterText(find.byType(TextField).at(2), 'password');
      await tester.enterText(find.byType(TextField).at(3), 'password');

      // Tap on the register button
      await tester.tap(find.text('Register'));
      await tester.pump();

      // Verify that the navigator was not triggered
      // verifyNever(mockObserver.didPush(any, any));
    });
  });
}
