// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:smarthome/homepage/log_reg_page/register_page.dart';

// // Create a mock for FirebaseAuth
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// // Create a mock for FirebaseFirestore
// class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

// void main() {
//   group('RegisterPage Widget Test', () {
//     testWidgets('Renders RegisterPage and triggers registration', (WidgetTester tester) async {
//       // Mock FirebaseAuth and provide it to the RegisterPage
//       final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
//       final MockFirebaseFirestore mockFirebaseFirestore = MockFirebaseFirestore();

//       when(mockFirebaseAuth.createUserWithEmailAndPassword(
//         email: anyNamed('email'),
//         password: anyNamed('password'),
//       )).thenAnswer((_) async => UserCredentialMock());

//       when(mockFirebaseFirestore.collection(any)).thenReturn(MockCollectionReference());

//       await tester.pumpWidget(
//         MaterialApp(
//           home: RegisterPage(
//             onTap: () {}, // Provide a dummy onTap function
//           ),
//         ),
//       );

//       // Verify that the RegisterPage is rendered
//       expect(find.text('SMART HOME'), findsOneWidget);

//       // Enter text into username, email, password, and confirm password fields
//       await tester.enterText(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == 'Username'), 'testuser');
//       await tester.enterText(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == 'Email'), 'test@example.com');
//       await tester.enterText(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == 'Password'), 'password123');
//       await tester.enterText(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == 'Confirm Password'), 'password123');

//       // Tap the register button
//       await tester.tap(find.text('Register'));

//       // Wait for the asynchronous process to complete
//       await tester.pump();

//       // Verify that createUserWithEmailAndPassword was called with the correct arguments
//       verify(mockFirebaseAuth.createUserWithEmailAndPassword(email: 'test@example.com', password: 'password123')).called(1);

//       // Verify that createUserDocument was called with the correct arguments
//       verify(mockFirebaseFirestore.collection('Users').doc('test@example.com').set({
//         'email': 'test@example.com',
//         'username': 'testuser',
//       })).called(1);
//     });
//   });
// }

// // Mock class for UserCredential
// class UserCredentialMock extends Mock implements UserCredential {}

// // Mock class for CollectionReference
// class MockCollectionReference extends Mock implements CollectionReference {}
