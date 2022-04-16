import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/pages/components/education/education.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Education> educationList = [
  Education(
      description: "SQL Programming",
      linkName:
          "https://drive.google.com/file/d/1F0DOtkjOEo2U8aMhMR9RRz15tGomNncn/view?usp=sharing",
      subTitle: "Linkedin Learning"),
  Education(
      description: "Programming Fundamental",
      linkName:
          "https://drive.google.com/file/d/1bHli4iH4jrxyPsfjnXDS-8MYn3I-Vus6/view?usp=sharing",
      subTitle: 'Linkedinin Learning'),
  Education(
      description: "Beginers Guide To C# ",
      linkName:
          "https://drive.google.com/file/d/1t9rCcyCicdRB2oLj3gZp9pNo2amYifM6/view?usp=sharing",
      subTitle: 'Linkedinin Learning'),
  Education(
      description: "Databases",
      linkName:
          "https://drive.google.com/file/d/15GJcMQD9QZx1BiQYCptbB8rDZcvZ0WdI/view?usp=sharing",
      subTitle: 'Linkedinin Learning'),
];

class education_section extends StatefulWidget {
  const education_section({Key? key}) : super(key: key);

  @override
  State<education_section> createState() => _education_sectionState();
}

class _education_sectionState extends State<education_section>
    with TickerProviderStateMixin {
  bool isHover = false;

  hoverActivation(hoverState) {
    setState(() {
      isHover = hoverState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
        width: double.infinity,
        child: screenDetector(
            mobile: buidUi(context, MediaQuery.of(context).size.width * .8),
            tablet: buidUi(context, 760),
            desktop: buidUi(context,1000)),
      ),
    );
  }

  Widget buidUi(BuildContext context, double width,) {
    return ResponsiveWrapper(
    maxWidth: width,
    minWidth: width,
    defaultScale: false,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Certifications",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.8,
              fontSize: 30),
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
                    return InkWell(
                      onTap: () {
                        launch(educationList[index].linkName);
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              educationList[index].description,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              educationList[index].subTitle,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 14,
                                color: kCaptionColor,
                              ),
                            ),
                          ], 
                        ),
                      ),
                    );
                  },
                  itemCount: educationList.length);
            },
          ),
        )
      ],
    ),
  );
  }
}
