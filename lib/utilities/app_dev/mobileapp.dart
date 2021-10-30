import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_framework.dart';

class mobileapp extends StatelessWidget {
  const mobileapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: screenDetector(
          mobile: _buildUi(MediaQuery.of(context).size.width * .8),
          tablet: _buildUi(760),
          desktop: _buildUi(1000)),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(builder: (contex, constraint) {
      return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Flex(
          direction:
              constraint.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MOBILE APP DEVELOPED BY ME",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "SMART SAVER",
                  style: GoogleFonts.oswald(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Thsbh fsbasdvasv lasbvdugcsa vcasuivasdb casdc oasgcasbdchasdcb asdvha svvlasbdvh sadvhbvhsbv,m s vjaslvk asbvhaskvasdv sudvv asldjvbahsdvaasvn andsv aisv lasb dvkasgd",
                  style: GoogleFonts.oswald(
                    fontSize: 15,
                    color: kCaptionColor,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: TextButton(
                          onPressed: () {},
                          child:const  Center(
                            child: Text(
                              "EXPLORE MORE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                   const SizedBox(
                      width: 10,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: kPrimaryColor,
                            )),
                        height: 49,
                        padding: EdgeInsets.symmetric(horizontal: 28),
                        child: TextButton(
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                "NEXT APP",
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      );
    }),
  );
}
