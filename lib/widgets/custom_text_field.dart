import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // Constructor with a named 'key' parameter and 'const'
  const CustomTextField({
    Key? key, // Named parameter for the key
    required this.label,
    this.initialValue,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.maxLines = 1,
  }) : super(key: key); // Call to super constructor with key

  final String label;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(), // Optional: customize the border
      ),
    );
  }
}
