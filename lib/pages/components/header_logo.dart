import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header_logo extends StatelessWidget {
  const Header_logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "A",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: ".",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: "F",
              style: GoogleFonts.oswald(
                color: Colors.green,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              )),
        ])),
      ),
    ));
  }
}
