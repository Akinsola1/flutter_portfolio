import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/pages/components/footer/contact/contact_item.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<contactItem> contactitem = [
  contactItem(
      iconpath: "assets/images/loaction.png",
      title: "ADDRESS",
      text1: "Nigeria, Abuja",
      text2: "Nigeria, Lagos"),
  contactItem(
      iconpath: "assets/images/phone.png",
      title: "PHONE",
      text1: "+234-90-3112-9609",
      text2: "+234-81-5624-4693"),
  contactItem(
      iconpath: "assets/images/mail.png",
      title: "E-Mail",
      text1: "Akindoyinfaruq@gmail.com",
      text2: "FlutterFarqu@gmail.com"),
  contactItem(
      iconpath: "assets/images/whatsapp.png",
      title: "WHATSAPP",
      text1: "+234-90-3112-9609",
      text2: "+234-81-5624-4693"),
];

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 30),
      child: screenDetector(
          mobile: _buildUi(MediaQuery.of(context).size.width * .8, context),
          tablet: _buildUi(700, context),
          desktop: _buildUi(1000, context)),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return LayoutBuilder(builder: (context, constraints) {
    return Center(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: contactitem
                        .map((contactitem) => Container(
                              height: 120,
                              width: screenDetector.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 20.0
                                  : constraints.maxWidth / 4.0 - 20.0,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          contactitem.iconpath,
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          contactitem.title,
                                          style: GoogleFonts.oswald(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "${contactitem.text1}\n",
                                            style: TextStyle(
                                                color: kCaptionColor, height: 1.5)),
                                        TextSpan(
                                            text: "${contactitem.text2}\n",
                                            style: TextStyle(
                                              color: kCaptionColor,
                                            ))
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flex(
                  direction: screenDetector.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  mainAxisAlignment: screenDetector.isMobile(context)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Copyright (c) 2021 Akinsola Faruq.A. All right Reserved ",
                        style: TextStyle(
                          color: kCaptionColor,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Privacy Policy",
                              style: TextStyle(
                                color: kCaptionColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "|",
                            style: TextStyle(color: kCaptionColor),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              "Terms & Conditions",
                              style: TextStyle(color: kCaptionColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  });
}
