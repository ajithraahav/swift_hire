import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;

  GradientButton({required this.text, required this.onPressed, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFCC8FED), Color(0xFF6B50F6)], // Adjust gradient colors as needed
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30.0), // Adjust button border radius as needed
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
