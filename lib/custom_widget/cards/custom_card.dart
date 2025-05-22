import 'package:flutter/material.dart';

class Custom_Card extends StatelessWidget {
  final List<Widget> children;

  const Custom_Card({
    super.key,
    required this.children, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0), 
      decoration: BoxDecoration(
        color: Color(0xFF1E1E2C), 
        borderRadius: BorderRadius.circular(20.0), 
        border: Border.all(
          color: Color(0xFF00FF88), 
          width: 3.0, 
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF00FF88).withOpacity(0.5),
            blurRadius: 20.0, 
            spreadRadius: 2.0, 
          ),
        ],
      ),
      child: Column(
        children: children, 
      ),
    );
  }
}
