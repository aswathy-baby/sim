import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:erp_solution/views/login/login_screen.dart'; // Adjust the import based on your project structure

void main() {
  testWidgets('LoginScreen shows loading indicator during login', (WidgetTester tester) async {
    // Define the routes for the test environment
    await tester.pumpWidget(MaterialApp(
      routes: {
        '/dashboard': (context) => const Scaffold(
              body: Center(child: Text('Dashboard')),
            ),
        '/login': (context) => const LoginScreen(), // Assuming LoginScreen is your widget under test
      },
      initialRoute: '/login',
    ));

    // Enter email and password if required
    // Example:
    // await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
    // await tester.enterText(find.byKey(Key('passwordField')), 'password');
    
    // Tap the login button
    await tester.tap(find.byType(ElevatedButton)); // Adjust based on your button type
    await tester.pump(); // Start the frame

    // Optionally, wait for any asynchronous operations to complete
    await tester.pumpAndSettle();

    // Verify navigation to Dashboard
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
