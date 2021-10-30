import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/carousel/carousel_items.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class carousel extends StatefulWidget {
  carousel({Key? key}) : super(key: key);

  @override
  State<carousel> createState() => _carouselState();
}

class _carouselState extends State<carousel> {
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    double carouseContainerHeight = MediaQuery.of(context).size.height *
        (screenDetector.isMobile(context) ? .7 : .85);
    return Container(
      height: carouseContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.center,
              child: CarouselSlider(
                  options: CarouselOptions(
                    // autoPlay: true,
                    viewportFraction: 1,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    height: carouseContainerHeight,
                  ),
                  items: List.generate(
                      5,
                      (index) => Builder(builder: (BuildContext context) {
                            return Container(
                              constraints: BoxConstraints(
                                  minHeight: carouseContainerHeight),
                              child: screenDetector(
                                  mobile:_buildMobile(
                                    context,
                                    carouselItems[index].text,
                                    carouselItems[index].image,
                                  ) ,
                                  tablet: _buildTablet(
                                    context,
                                    carouselItems[index].text,
                                    carouselItems[index].image,
                                  ),
                                  desktop: _buildDesktop(
                                    context,
                                    carouselItems[index].text,
                                    carouselItems[index].image,
                                  )),
                            );
                          })).toList()))
        ],
      ),
    );
  }
}

Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
        maxWidth: 1000,
        minWidth: 1000,
        defaultScale: false,
        child: Row(
          children: [Expanded(child: text), Expanded(child: image)],
        )),
  );
}

Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
        maxWidth: 760,
        minWidth: 760,
        defaultScale: false,
        child: Row(
          children: [Expanded(child: text), Expanded(child: image)],
        )),
  );
}

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width * 0.8,
    ),
    width: double.infinity,
    child: text,
  );
}
