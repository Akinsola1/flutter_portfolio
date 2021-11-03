import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/app_dev/mobileapp.dart';
import 'package:my_portfolio/pages/components/app_dev/problem_solving_application.dart';
import 'package:my_portfolio/pages/components/carousel/carousel.dart';
import 'package:my_portfolio/pages/components/cv_section/cv_section.dart';
import 'package:my_portfolio/pages/components/education/education_section.dart';
import 'package:my_portfolio/pages/components/headers/global.dart';
import 'package:my_portfolio/pages/components/headers/header.dart';
import 'package:my_portfolio/pages/components/headers/header_item.dart';
import 'package:my_portfolio/pages/components/skills/skill_section.dart';
import 'package:my_portfolio/pages/components/stats/portfoliostate.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/mobile_json.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                            padding: const EdgeInsets.symmetric(horizontal: 28),
                            child: TextButton(
                              onPressed: hearderItems[index].onTap,
                              child: Text(
                                hearderItems[index].title,
                                style: const TextStyle(
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
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox();
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
            const SizedBox(
              height: 10,
            ),
            cv_section(),
            mobileapp(
              image_url: '',
              image_url1: '',
              title: mobile[0]['name'],
              Short_note: mobile[0]['short_note'],
              branch: mobile[0]['branch'],
            ),
            const SizedBox(height: 30),
            problem_solving_application(
                image_url: '',
                title: real_life[0]['name'],
                Short_note: real_life[0]['short_note'],
                branch: real_life[0]['branch']),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: portfolioState(),
            ),
            const SizedBox(
              height: 50,
            ),
            education_section(),
            SizedBox(
              height: 50,
            ),
            skill_section(),
          ],
        )),
      ),
    );
  }
}
