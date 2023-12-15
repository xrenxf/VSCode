// // Import necessary packages and classes
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:smarthome/homepage/log_reg_page/login_page.dart';

// // Create a mock for FirebaseAuth
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// // Create a mock for UserCredential
// class MockUserCredential extends Mock implements UserCredential {}

// void main() {
//   group('LoginPage Widget Test', () {
//     testWidgets('Renders LoginPage and triggers login', (WidgetTester tester) async {
//       // Mock FirebaseAuth and provide it to the LoginPage
//       final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
//       final MockUserCredential mockUserCredential = MockUserCredential();

//       when(mockFirebaseAuth.signInWithEmailAndPassword(
//         email: 'email',
//         password: 'password',
//       )).thenAnswer((_) async => mockUserCredential);

//       await tester.pumpWidget(
//         MaterialApp(
//           home: LoginPage(
//             onTap: () {}, // Provide a dummy onTap function
//           ),
//         ),
//       );

//       // Verify that the LoginPage is rendered
//       expect(find.text('SMART HOME'), findsOneWidget);

//       // Enter text into email and password fields
//       await tester.enterText(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == 'Email'), 'test@example.com');
//       await tester.enterText(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == 'Password'), 'password123');

//       // Tap the login button
//       await tester.tap(find.text('Login'));

//       // Wait for the asynchronous process to complete
//       await tester.pump();

//       // Verify that signInWithEmailAndPassword was called with the correct arguments
//       verify(mockFirebaseAuth.signInWithEmailAndPassword(email: 'test@example.com', password: 'password123')).called(1);
//     });
//   });
// }
