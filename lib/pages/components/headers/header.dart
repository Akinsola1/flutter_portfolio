import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/app_dev/mobileapp.dart';
import 'package:my_portfolio/pages/components/footer/contact/contact.dart';
import 'package:my_portfolio/pages/components/headers/global.dart';
import 'package:my_portfolio/pages/components/headers/header_item.dart';
import 'package:my_portfolio/pages/components/headers/header_logo.dart';
import 'package:my_portfolio/pages/components/headers/headerrow.dart';
import 'package:my_portfolio/pages/components/hireMe/hireme.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:url_launcher/url_launcher.dart';

List<HeaderItem> hearderItems = [
  HeaderItem(
      onTap: () {
        launch(
            'https://drive.google.com/file/d/1xgbTRdF2bi2JUndscVm0qbmyQ6ERd3Uy/view?usp=sharing');
      },
      title: "RESUME"),
  HeaderItem(onTap: () {}, title: "PROJECTS"),
  HeaderItem(onTap: () {}, title: "EDUACTION"),
  HeaderItem(onTap: () {}, title: "SKILLS"),
  HeaderItem(
      onTap: () {
        {
          const String email = 'akindoyinfaruq@gmail.com';
          const String Subject = 'Hire Akinsola Faruq now';
          final url =
              'mailto: $email?subject=${Uri.encodeFull(Subject)}&body=${Uri.encodeFull('Write job description and contact information (optional)')}';
          launch(url);
        }
      },
      title: "Contact Me",
      isButton: true),
];

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: screenDetector(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: buildHeader(),
        ),
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  Widget buildMobileHeader() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Header_logo(),
          GestureDetector(
            onTap: () {
              Global.scaffoldKey.currentState!.openEndDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
          )
        ],
      ),
    ));
  }

  Widget buildHeader() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header_logo(),
            HeaderRow(),
          ],
        ));
  }
}
