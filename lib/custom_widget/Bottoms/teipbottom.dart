import 'package:flutter/material.dart';

class tripbottom extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Allow null for onPressed

  const tripbottom({
    super.key,
    required this.text, // Button text
    this.onPressed, // Allow nullable callback
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed, // Pass the nullable callback
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: onPressed != null
              ? Color(0xFFe1d991)
              : Colors.grey, // Disable color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18, // Font size
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
    );
  }
}
