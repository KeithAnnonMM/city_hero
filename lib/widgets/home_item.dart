import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.icon,
    required this.text,
    required this.function,
    required this.color,
  });
  final Icon icon;
  final String text;
  final function;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: function, icon: icon),
            const SizedBox(height: 6),
            Text(
              text,
              style: GoogleFonts.poppins(fontSize: 15, color: color),
            )
          ],
        ),
      ),
    );
  }
}
