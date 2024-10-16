import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:erp_solution/widgets/custom_text_field.dart'; // Adjusted import based on your project structure

void main() {
  testWidgets('shows validation error for empty input', (WidgetTester tester) async {
    // Define a GlobalKey for the Form
    final formKey = GlobalKey<FormState>();

    // Build the widget tree with Form and CustomTextField
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email'; // Validation message
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Trigger form validation
                  formKey.currentState?.validate();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    ));

    // Initially, there should be no validation error
    expect(find.text('Please enter your email'), findsNothing);

    // Tap the submit button to trigger validation
    await tester.tap(find.text('Submit'));
    await tester.pump(); // Rebuild the widget tree

    // Verify the validation message appears
    expect(find.text('Please enter your email'), findsOneWidget);
  });
}
