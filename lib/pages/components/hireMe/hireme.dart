import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utilities/import.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class hireme extends StatelessWidget {
  const hireme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: screenDetector(
          mobile: _buildUi(MediaQuery.of(context).size.width * .8),
          tablet: _buildUi(700),
          desktop: _buildUi(1000),
        ),
      ),
    );
  }
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints contraint) {
      return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 600,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text('HIRE ME',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 30,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Theme(
                              data: ThemeData(
                                primaryColor: Colors.white,
                                primaryColorDark: Colors.grey,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: 'Personal name or company name',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                  labelText: 'Name',
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Theme(
                              data: ThemeData(
                                primaryColor: Colors.white,
                                primaryColorDark: Colors.grey,
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  hintText: 'Email or phone number',
                                  hintStyle: TextStyle(color: Colors.black),
                                  labelText: 'Contact',
                                ),
                              )),
                        ),
                        Container(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Theme(
                                data: ThemeData(
                                  primaryColor: Colors.white,
                                  primaryColorDark: Colors.grey,
                                ),
                                child: const TextField(                                  maxLines: 100,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    hintText: 'Job description',
                                    hintStyle: TextStyle(color: Colors.black),
                                    labelText: 'JOB',
                                  ),
                                )),
                          ),
                        )
                      ],
                    ))),
          )));
    }),
  );
}
