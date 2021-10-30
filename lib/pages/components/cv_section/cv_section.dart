import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/design_process.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<DesignProcess> designProcess = [
  DesignProcess(
      title: "DESIGN",
      imagePath: '',
      substitle: "shkfasd  hkfajrhbaks hvbashvsohvas gvfvbk jjfbvhsabn"),
  DesignProcess(
      title: "Effecience",
      imagePath: '',
      substitle: "shkfasd  hkfajrhbaks hvbashvsohvas gvfvbk jjfbvhsabn"),
  DesignProcess(
      title: "DESIGN",
      imagePath: '',
      substitle: "shkfasd  hkfajrhbaks hvbashvsohvas gvfvbk jjfbvhsabn"),
  DesignProcess(
      title: "DESIGN",
      imagePath: '',
      substitle: "shkfasd  hkfajrhbaks hvbashvsohvas gvfvbk jjfbvhsabn"),
];

class cv_section extends StatelessWidget {
  const cv_section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: screenDetector(
        mobile: (_buildUi(context, MediaQuery.of(context).size.width * .8)),
        tablet: _buildUi(context, 760),
        desktop: _buildUi(context, 1000),
      ),
    );
  }
}

Widget _buildUi(BuildContext context, double width) {
  return ResponsiveWrapper(
    maxWidth: width,
    minWidth: width,
    defaultScale: false,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "SIMPLE FARUQ \nGREAT QUALITIES",
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  fontSize: 18),
            ),
            GestureDetector(
              onTap: () {},
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  "Download CV",
                  style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 59),
        Container(
          child: LayoutBuilder(
            builder: (_context, constraint) {
              return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      maxCrossAxisExtent: screenDetector.isTablet(context) ||
                              screenDetector.isMobile(context)
                          ? constraint.maxWidth / 2
                          : 250,
                      childAspectRatio: screenDetector.isDesktop(context)
                          ? 1
                          : MediaQuery.of(context).size.aspectRatio * 1.5),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                designProcess[index].imagePath,
                                width: 40,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                designProcess[index].title,
                                style: GoogleFonts.oswald(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            designProcess[index].substitle,
                            style: GoogleFonts.oswald(
                              height: 1.5,
                              fontSize: 14,
                              color: kCaptionColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: designProcess.length);
            },
          ),
        )
      ],
    ),
  );
}
