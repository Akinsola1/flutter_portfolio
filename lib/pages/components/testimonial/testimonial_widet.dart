import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/pages/components/testimonial/testimonial.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<testimonial> testimonials = [
  testimonial(
      text:
          "Met faruq at the just concluded Hackathon and was flabbergasted about is intrest for computers and the tech word in general.He has always done a satisfactory work for me and i will always recommend him 👍",
      Occupation: "Photographer",
      personName: "AAdebola Frank",
      profilaPhoto: "assets/images/avater4.png"),
  testimonial(
      text:
          "Met faruq at the just concluded Hackathon and was flabbergasted about is intrest for computers and the tech word in general.He has always done a satisfactory work for me and i will always recommend him 👍",
      Occupation: "Software Engineer",
      personName: "Akinsola Faruq.A",
      profilaPhoto: "assets/images/avater1.jpg"),
  testimonial(
      text:
          "Met faruq at the just concluded Hackathon and was flabbergasted about is intrest for computers and the tech word in general.He has always done a satisfactory work for me and i will always recommend him 👍",
      Occupation: "Software Engineer",
      personName: "Akinsola Faruq.A",
      profilaPhoto: "assets/images/avater3.png"),
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
            Text(
              "TESTIMONIAL",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30,
                height: 1.3,
              ),
            ),
            SizedBox(
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
                  TextSpan(
                    text: "Click here to view more. ",
                    style: TextStyle(
                      color: kPrimaryColor,
                      height: 1.8,
                    ),
                  ),
                  TextSpan(
                      text: "Dont forget to leave a note",
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.8,
                      )),
                ]))),
            SizedBox(
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
                    margin: EdgeInsets.only(bottom: 50),
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
                                    style: GoogleFonts.oswald(
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
