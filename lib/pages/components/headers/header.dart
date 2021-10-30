import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/headers/global.dart';
import 'package:my_portfolio/pages/components/headers/header_item.dart';
import 'package:my_portfolio/pages/components/headers/header_logo.dart';
import 'package:my_portfolio/pages/components/headers/headerrow.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:fluttericon/typicons_icons.dart';

List<HeaderItem> hearderItems = [
  HeaderItem(onTap: () {}, title: "HOME"),
  HeaderItem(onTap: () {}, title: "MY INTRO"),
  HeaderItem(onTap: () {}, title: "SERVICE"),
  HeaderItem(onTap: () {}, title: "PORTFOLIO"),
  HeaderItem(onTap: () {}, title: "TESTIMONIAL"),
  HeaderItem(onTap: () {}, title: "BLOGS"),
  HeaderItem(onTap: () {}, title: "HIRE ME", isButton: true),
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

