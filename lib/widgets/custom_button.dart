import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // Constructor with a named 'key' parameter and 'const'
  const CustomButton({
    Key? key, // Named parameter for the key
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
  }) : super(key: key); // Call to super constructor with key

  final String label;
  final void Function() onPressed;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: color, // Text color
      ),
      child: Text(label), // Button label
    );
  }
}
