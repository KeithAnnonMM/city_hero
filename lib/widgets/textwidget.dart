import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.size,
    required this.text,
    required this.bold,
  });
  final String text;
  final double size;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
