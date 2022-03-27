import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar dayViewAppBar(double width, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    bottomOpacity: 0,
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    title: SizedBox(
      width: width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Bandung, ",
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "Indonesia",
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white54,
            ),
          ),
        ],
      ),
    ),
    centerTitle: true,
    leading: InkWell(child: const Icon(Icons.arrow_back_ios), onTap: () =>Navigator.of(context).pop()),
  );
}