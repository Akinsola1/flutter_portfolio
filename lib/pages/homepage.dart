import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/exports.dart';

import 'components/app_dev/problem_solving_application.dart';

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
              title: mobile[1]['name'],
              Short_note: mobile[1]['short_note'],
              branch: mobile[1]['branch'],
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
            const education_section(),
            const skill_section(),
            const SizedBox(
              height: 50,
            ),
            const testimonialWidget(),
            const contact(),
            const social(),
          ],
        )),
      ),
    );
  }
}
