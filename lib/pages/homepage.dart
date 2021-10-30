import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/carousel/carousel.dart';
import 'package:my_portfolio/pages/components/cv_section/cv_section.dart';
import 'package:my_portfolio/pages/components/headers/global.dart';
import 'package:my_portfolio/pages/components/headers/header.dart';
import 'package:my_portfolio/pages/components/headers/header_item.dart';
import 'package:my_portfolio/utilities/app_dev/mobileapp.dart';
import 'package:my_portfolio/utilities/constand.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Global.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return hearderItems[index].isButton
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kDangerColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: TextButton(
                              onPressed: hearderItems[index].onTap,
                              child: Text(
                                hearderItems[index].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                        )
                      : ListTile(
                          title: Text(
                          hearderItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox();
                },
                itemCount: hearderItems.length),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Header(),
            ),
            carousel(),
            SizedBox(height: 20,),
            cv_section(),
            mobileapp(),
          ],
        )),
      ),
    );
  }
}
