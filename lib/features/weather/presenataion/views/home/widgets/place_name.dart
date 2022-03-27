import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceName extends StatelessWidget {
  const PlaceName({
    Key? key,
    required this.height,  required this.country, required this.name,
  }) : super(key: key);

  final double height;
  final String country;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: (height * 0.015), bottom: (height * 0.02)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "$country, ",
            style: GoogleFonts.lato(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            name,
            style: GoogleFonts.lato(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
