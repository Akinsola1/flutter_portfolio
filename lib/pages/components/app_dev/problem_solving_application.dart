import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class problem_solving_application extends StatefulWidget {
  final String image_url;
  final String title;
  final String Short_note;
  final String branch;
  problem_solving_application(
      {Key? key,
      required this.image_url,
      required this.title,
      required this.Short_note,
      required this.branch})
      : super(key: key);

  @override
  State<problem_solving_application> createState() =>
      _problem_solving_applicationState();
}

class _problem_solving_applicationState
    extends State<problem_solving_application> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: screenDetector(
          mobile: _buildUi(MediaQuery.of(context).size.width * .8,
              widget.image_url, widget.title, widget.Short_note, widget.branch),
          tablet: _buildUi(760, widget.image_url, widget.title,
              widget.Short_note, widget.branch),
          desktop: _buildUi(1000, widget.image_url, widget.title,
              widget.Short_note, widget.branch)),
    );
  }
}

class image1 extends StatelessWidget {
  const image1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/craftsman1.png');
  }
}

class image2 extends StatelessWidget {
  const image2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/craftsman2.png');
  }
}

class image3 extends StatelessWidget {
  const image3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/crafrsman3.png');
  }
}

class image4 extends StatelessWidget {
  const image4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/craftsman4.png');
  }
}

class image_carousel extends StatefulWidget {
  image_carousel({
    Key? key,
  }) : super(key: key);

  @override
  _image_carouselState createState() => _image_carouselState();
}

class _image_carouselState extends State<image_carousel> {
  int _currentIndex = 0;

  List cardList = [
   const image1(),
    const image2(),
    const image3(),
    const image4(),
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 500.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 3.0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: cardList.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            height: 500,
            width: 240,
            child: Card(
              color: Colors.transparent,
              child: card,
            ),
          );
        });
      }).toList(),
    );
  }
}

Widget _buildUi(
  double width,
  final String image_url,
  final String title,
  final String Short_note,
  final String branch,
) {
  return Center(
    child: LayoutBuilder(builder: (contex, constraint) {
      return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Flex(
            direction:
                constraint.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                  flex: constraint.maxWidth > 720 ? 1 : 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$branch",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$title',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$Short_note",
                        style: TextStyle(
                          fontSize: 15,
                          color: kCaptionColor,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              height: 48,
                              padding: EdgeInsets.symmetric(horizontal: 28),
                              child: TextButton(
                                onPressed: () {
                                  launch('https://github.com/Akinsola1/CraftsMan_rebranded');
                                },
                                child: const Center(
                                  child: Text(
                                    "DOCUMENTATION",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: kPrimaryColor,
                                  )),
                              height: 49,
                              padding: EdgeInsets.symmetric(horizontal: 28),
                              child: TextButton(
                                  onPressed: () {
                                    launch('https://github.com/Akinsola1');
                                  },
                                  child: const Center(
                                    child: Text(
                                      "MORE APPS",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
              SizedBox(height: 20),
              Expanded(
                flex: constraint.maxWidth > 720 ? 1 : 0,
                child: image_carousel(),
              ),
            ],
          ),
        ),
      );
    }),
  );
}
