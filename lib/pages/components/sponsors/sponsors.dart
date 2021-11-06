import 'package:flutter/material.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<String> sponsoreLogo = [
  "",
  "",
  "",
  "",
  "",
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
              .map((logo) => Container(
                  height: 20,
                  constraints: BoxConstraints(
                      maxWidth: screenDetector.isMobile(context)
                          ? constraint.maxWidth / 3.0 - 50
                          : constraint.maxWidth / 5.0 - 50)))
              .toList(),
        );
      }),
    ),
  );
}
