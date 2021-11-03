import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/pages/components/skills/skills_model.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

List<Skill> skills = [
  Skill(skill: "Dart", percentage: 70),
  Skill(skill: "Git", percentage: 80),
  Skill(skill: "Kotlin", percentage: 60),
  Skill(skill: "Swift", percentage: 50),
];

class skill_section extends StatelessWidget {
  const skill_section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: screenDetector(
          mobile: _buildUi(MediaQuery.of(context).size.width * .8),
          tablet: _buildUi(700),
          desktop: _buildUi(1000)),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      return ResponsiveWrapper(
        minWidth: width,
        maxWidth: width,
        child: Flex(
            direction: screenDetector.isMobile(context)
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              Expanded(
                flex: screenDetector.isMobile(context) ? 0 : 2,
                child: Image.asset(
                  '',
                  width: 300,
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                  flex: screenDetector.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SKILLS",
                        style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                            height: 1.3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'This just a junk text and blas= asdjbsdhbsmdv hsbjasdcb  havhca scga asgdc adcbbacva ca as ashsdchas assdvmcas s kasvygsdascachyadc asca',
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                          children: skills
                              .map((skills) => Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: skills.percentage,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          alignment: Alignment.centerLeft,
                                          height: 38,
                                          child: Text(
                                            skills.skill,
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 100 - skills.percentage,
                                        child: Divider(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "${skills.percentage}%",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  )))
                              .toList())
                    ],
                  ))
            ]),
      );
    }),
  );
}
