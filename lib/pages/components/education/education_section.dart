import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/pages/components/education/education.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<Education> educationList = [
  Education(
      description:
          "this is my boring education history and i hope you love it ",
      linkName: "www.bbbbbb.com",
      period: "2019 - 2021"),
      Education(
      description:
          "this is my boring education history and i hope you love it ",
      linkName: "www.bbbbbb.com",
      period: "2019 - 2021"),
      Education(
      description:
          "this is my boring education history and i hope you love it ",
      linkName: "www.bbbbbb.com",
      period: "2019 - 2021"),
      Education(
      description:
          "this is my boring education history and i hope you love it ",
      linkName: "www.bbbbbb.com",
      period: "2019 - 2021"),
];

class education_section extends StatelessWidget {
  const education_section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: screenDetector(
          mobile: buidUi(MediaQuery.of(context).size.width * .8),
          tablet: buidUi(800),
          desktop: buidUi(1000)),
    );
  }

  Widget buidUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("EDUCATION",
                style: GoogleFonts.oswald(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.3)),
            const SizedBox(
              height: 5,
            ),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Text(
                    "a full ,kbkjsb vsajvjkdvas dvasv bsadhv sdvs dvbsdvv sdvl sdbusad sahdvbsa dvs dvb asvashbvs vagsv asdvbsv lasvyds",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          LayoutBuilder(builder: (context, constraint) {
            return Container(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: educationList.map(
                  (education) => Container(
                    width: constraint.maxWidth/2.0-20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          education.period,
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                          )
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          education.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              education.linkName,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )

                      ],
                    )
                  )
                ).toList()
              ),
            );
          })
          ],
        ),
      ),
    );
  }
}