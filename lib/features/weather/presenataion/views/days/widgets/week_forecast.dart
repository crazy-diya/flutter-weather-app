
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekForecast extends StatelessWidget {
  const WeekForecast({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.75,
      width: width,
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.cloud, color: Colors.white),
          title: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Monday, ",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "3 Oct",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
          trailing: SizedBox(
            width: width * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "32",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "/33\u00b0",
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
