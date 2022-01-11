import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/design_process.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_grid.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<DesignProcess> designProcess = [
  DesignProcess(
      title: "CREATIVE",
      imagePath: 'assets/images/problem_solver.png',
      substitle: "Solve problem and seek solution that creatively allign user needs and bussiness goals."),
  DesignProcess(
      title: "EMPHATY",
      imagePath: 'assets/images/emphaty.png',
      substitle: "Understands client's conditon from their perspective."),
  DesignProcess(
      title: "TEAM PLAYER",
      imagePath: 'assets/images/team.png',
      substitle: "Work with Back-End developers to build beautiful and well optimized apps."),
  DesignProcess(
      title: "ANALYTICAL",
      imagePath: 'assets/images/highlevel.png',
      substitle: "Always able to justify every design decision based on best practices and data."),
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
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.8,
                  fontSize: 18),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  launch('https://drive.google.com/file/d/1xgbTRdF2bi2JUndscVm0qbmyQ6ERd3Uy/view?usp=sharing');
                },
                child: Text(
                  "See my resume",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 59),
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
                                width: 10,
                              ),
                              Text(
                                designProcess[index].title,
                                style: TextStyle(
                                    fontSize: 18,
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
                            style: TextStyle(
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
