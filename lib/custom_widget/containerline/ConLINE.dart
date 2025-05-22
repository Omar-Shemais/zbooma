import 'package:flutter/material.dart';

class ContainerLine extends StatelessWidget {
  const ContainerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full-width container
      height: 4, // Thickness of the line
      decoration: BoxDecoration(
        color: Colors.green, // Line color
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.5), // Shadow color
            blurRadius: 20, // Strength of the blur
            spreadRadius: 5, // Spread of the shadow
            offset: Offset(0, 0), // Position of the shadow
          ),
        ],
      ),
    );
  }
}
