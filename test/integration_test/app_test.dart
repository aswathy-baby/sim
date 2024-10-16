// test/views/login_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:erp_solution/views/login/login_screen.dart';
import 'package:erp_solution/controllers/auth_controller.dart';

void main() {
  group('LoginScreen Tests', () {
    testWidgets('LoginScreen has a title and a login button', (WidgetTester tester) async {
      // Arrange: Create an instance of AuthController
      final authController = AuthController();

      // Act: Build the LoginScreen widget inside a Provider
      await tester.pumpWidget(
        ChangeNotifierProvider<AuthController>.value(
          value: authController,
          child: const MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      // Assert: Verify that the AppBar title 'ERP Login' is present
      expect(find.text('ERP Login'), findsOneWidget);

      // Assert: Verify that the login button with the specific Key is present
      expect(find.byKey(const Key('login_button')), findsOneWidget);

      // Optionally, verify the button's text
      expect(
        find.descendant(
          of: find.byKey(const Key('login_button')),
          matching: find.text('Login'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('LoginScreen allows user to enter email and password', (WidgetTester tester) async {
      // Arrange: Create an instance of AuthController
      final authController = AuthController();

      // Act: Build the LoginScreen widget inside a Provider
      await tester.pumpWidget(
        ChangeNotifierProvider<AuthController>.value(
          value: authController,
          child: const MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      // Enter email using the assigned Key
      await tester.enterText(find.byKey(const Key('email_field')), 'admin@example.com');

      // Enter password using the assigned Key
      await tester.enterText(find.byKey(const Key('password_field')), 'password123');

      // Assert: Verify that the entered text appears in the fields
      expect(find.text('admin@example.com'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);
    });

    // Additional tests can be added here
  });
}
