import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_framework.dart';

class mobileapp extends StatefulWidget {
  final String image_url;
  final String title;
  final String Short_note;
  final String branch;

  mobileapp(
      {Key? key,
      required this.image_url,
      required this.title,
      required this.Short_note,
      required this.branch})
      : super(key: key);

  @override
  State<mobileapp> createState() => _mobileappState();
}

class _mobileappState extends State<mobileapp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: screenDetector(
          mobile: _buildUi(MediaQuery.of(context).size.width * .8,
              widget.image_url, widget.title, widget.Short_note, widget.branch),
          tablet: _buildUi(760, widget.image_url, widget.title,
              widget.Short_note, widget.branch),
          desktop: _buildUi(1000, widget.image_url, widget.title,
              widget.Short_note, widget.branch)),
    );
  }
}

Widget _buildUi(
  double width,
  final String image_url,
  final String title,
  final String Short_note,
  final String branch,
) {
  return Center(
    child: LayoutBuilder(builder: (contex, constraint) {
      return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Flex(
            direction:
                constraint.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
            children: [
              Expanded(
                  flex: constraint.maxWidth > 720 ? 1 : 0,
                  child: Image.asset(
                    '$image_url',
                    height: 500,
                    width: 500,
                  )),
             const SizedBox(
                height: 10,
              ),
              Expanded(
                  flex: constraint.maxWidth > 720 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$branch",
                        style: GoogleFonts.oswald(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                       const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$title',
                        style: GoogleFonts.oswald(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$Short_note",
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
                                child: const Center(
                                  child: Text(
                                    "DOCUMENTATION",
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
                  )),
              // SizedBox(
              //   height: 40,
              // )
            ],
          ),
        ),
      );
    }),
  );
}

