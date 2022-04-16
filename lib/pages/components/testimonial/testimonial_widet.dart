import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/testimonial/testimonial.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<testimonial> testimonials = [
  testimonial(
      text:
          "Faruq has been a very collaborative partner in any project we've worked on and makes litrarily any project fun 🚀.",
      Occupation: "Photographer",
      personName: "Oki Adeola",
      profilaPhoto: "assets/images/random1.jpg"),   
  testimonial(
      text:
          "The best frontend developer you will ever come accross.",
      Occupation: "Software Engineer",
      personName: "Patrick Odey Joseph",
      profilaPhoto: "assets/images/patrick.jpg"),
  testimonial(
      text:
          "Sometimes i start to wonder what he can't build with Flutter 😂",
      Occupation: "Software Designer",
      personName: "Berida Toluse",
      profilaPhoto: "assets/images/adeola.jpg"),
];

class testimonialWidget extends StatelessWidget {
  const testimonialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: screenDetector(
            mobile: _builUi(MediaQuery.of(context).size.width * .8),
            tablet: _builUi(700),
            desktop: _builUi(1000)));
  }
}

Widget _builUi(double width) {
  return Center(
    child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
      return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "TESTIMONIAL",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30,
                height: 1.3,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text:
                          "Check out the Satisfactory note from client and team mate ",
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.8,
                      )),
                ]))),
            const SizedBox(
              height: 45,
            ),
            Flex(
              direction: screenDetector.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: testimonials.map((testimonial) {
                return Expanded(
                  flex: screenDetector.isMobile(context) ? 0 : 1,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/images/quote.png",
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          testimonial.text,
                          style: TextStyle(color: kCaptionColor, height: 1.8),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage(testimonial.profilaPhoto),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonial.personName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    testimonial.Occupation,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ])
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    }),
  );
}
