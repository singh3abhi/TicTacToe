import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text, required this.kcolor});
  final String text;
  final Color kcolor;
  static const bColor = Color.fromARGB(255, 51, 34, 105);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.shade800,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.titanOne(
              color: kcolor,
              fontSize: 75,
            ),
          ),
        ),
      ),
    );
  }
}
