import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/sponsors/sponsorlogo.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<SponsorLogo> sponsoreLogo = [
  SponsorLogo(imageurl: "assets/images/twitter.png", link: 'https://twitter.com/AkindoyinFaruq?t=xXeXj-Ddy_CW5w7Z7w0Seg&s=09'),
  SponsorLogo(imageurl:   "assets/images/snapchat.png", link: 'https://www.snapchat.com/add/akins_21?share_id=OgQIBB10bXM&locale=en-GB'),
  SponsorLogo(imageurl: "assets/images/instagram.png", link: 'https://instagram.com/akindoyin_faruq?utm_medium=copy_link'),
  SponsorLogo(imageurl: "assets/images/linkedin.png", link: 'https://www.linkedin.com/in/akinsola-faruq-395110208.'),
  SponsorLogo(imageurl: "assets/images/github.png", link: 'https://github.com/Akinsola1') 
];

class social extends StatelessWidget {
  const social({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: screenDetector(
          mobile: _buildUi(MediaQuery.of(context).size.width * .8),
          tablet: _buildUi(780),
          desktop: _buildUi(1000)),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: ResponsiveWrapper(
      minWidth: width,
      maxWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
        return Wrap(
          runSpacing: 50,
          spacing: 50,
          children: sponsoreLogo
              .map((sponsorlogo) => MouseRegion(
                cursor:SystemMouseCursors.click,
                child: Container(
                    height: 20,
                    child: GestureDetector(
                      onTap: () {
                        launch(sponsorlogo.link);
                      } ,
                      child: Image.asset(sponsorlogo.imageurl)
                      ),
                    constraints: BoxConstraints(
                        maxWidth: screenDetector.isMobile(context)
                            ? constraint.maxWidth / 3.0 - 50
                            : constraint.maxWidth / 5.0 - 50)),
              ))
              .toList(),
        );
      }),
    ),
  );
}
