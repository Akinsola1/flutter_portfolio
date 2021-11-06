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
          "jhasdbv sgdh ashdvhask vashbdv ahsdvhasd kvhas vhasv hasdvhsdv ysbv savshdv asdhv asbhv ashdvbasjdvb ashdvasjdvb  bajdvashvbhasdv jasd",
      Occupation: "Software Engineer",
      personName: "Akinsola Faruq.A",
      profilaPhoto: "profilaPhoto"),
  testimonial(
      text:
          "jhasdbv sgdh ashdvhask vashbdv ahsdvhasd kvhas vhasv hasdvhsdv ysbv savshdv asdhv asbhv ashdvbasjdvb ashdvasjdvb  bajdvashvbhasdv jasd",
      Occupation: "Software Engineer",
      personName: "Akinsola Faruq.A",
      profilaPhoto: "profilaPhoto"),
  testimonial(
      text:
          "jhasdbv sgdh ashdvhask vashbdv ahsdvhasd kvhas vhasv hasdvhsdv ysbv savshdv asdhv asbhv ashdvbasjdvb ashdvasjdvb  bajdvashvbhasdv jasd",
      Occupation: "Software Engineer",
      personName: "Akinsola Faruq.A",
      profilaPhoto: "profilaPhoto"),
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
                          "ksvjf sa vjasvaskdv naskdv asjd sdvbasjdskdv asvb svbs",
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.8,
                      )),
                  TextSpan(
                    text: "Click here to view",
                    style: TextStyle(
                      color: kPrimaryColor,
                      height: 1.8,
                    ),
                  ),
                  TextSpan(
                      text: " Please follow :) ",
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
                            "",
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
                              height: 20,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonial.personName,
                                    style: GoogleFonts.oswald(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
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
