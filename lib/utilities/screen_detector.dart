import 'package:flutter/material.dart';

class screenDetector extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  screenDetector(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop})
      : super(key: key);
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 800;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop;
      } else if (MediaQuery.of(context).size.width >= 800 &&
          MediaQuery.of(context).size.width < 1200) {
        return tablet;
      } else if (MediaQuery.of(context).size.width < 800){
        return mobile;
      }else {
        return SizedBox();
      }
    });
  }
}
