import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smarthome/homepage/log_reg_page/button.dart';
import 'package:smarthome/homepage/log_reg_page/login_page.dart';
import 'package:smarthome/homepage/log_reg_page/textfield.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}

void main() {
  // Mock objects
  late LoginPage loginPage;
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    loginPage = LoginPage(onTap: () {});
  });

  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: loginPage));

    // Verify if the widgets are present
    expect(find.text('SMART HOME'), findsOneWidget);
    expect(find.byType(MyTextField), findsNWidgets(2));
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.byType(MyButton), findsOneWidget);
    expect(find.text("Don't have an account? "), findsOneWidget);
    expect(find.text('Register Here'), findsOneWidget);
  });

  testWidgets('Login Process Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: loginPage));

    // Simulate entering email and password
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');

    // Tap the login button
    await tester.tap(find.text('Login'));
    await tester.pump();

    // Mock the sign in method
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password123',
    )).thenAnswer((_) async => MockUserCredential());

    // Verify if the login method is called
    verify(mockFirebaseAuth.signInWithEmailAndPassword(
      email: 'test@example.com',
      password: 'password123',
    )).called(1);
  });
}
