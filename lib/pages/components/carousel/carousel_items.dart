import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/pages/components/carousel/carousel_items_model.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:url_launcher/url_launcher.dart';

List<CarouselItemModel> carouselItems = List.generate(
    5,
    (index) => CarouselItemModel(
        text: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
             const  Text(
                "MOBILE APP DEVELOPER",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
             const  Text(
                "AKINSOLA \n FARUQ.A",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  height: 1.3,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Flutter Developer, based in Nigeria",
                style: TextStyle(
                  color: kCaptionColor,
                  fontSize: 15,
                  height: 1.0,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: Wrap(
                  children: [
                    const Text(
                      "Do you have a mobile app idea? ",
                      style: TextStyle(
                          color: kCaptionColor, fontSize: 15, height: 1.5),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Plan on learning Flutter? Let's talk",
                            style: TextStyle(
                              height: 1.5,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 48,
                  padding:const  EdgeInsets.symmetric(horizontal: 28),
                  child: TextButton(
                    onPressed: () {
                      const String email = 'akindoyinfaruq@gmail.com';
                      const  String Subject = 'Hire Akinsola Faruq now';
                      final url = 'mailto: $email?subject=${Uri.encodeFull(Subject)}&body=${Uri.encodeFull('Write job description and contact information (optional)')}';
                      launch(url);
                    },
                    child: const Text(
                      "HIRE ME",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        image: Container(
          height: 400,
          width: 70,
          decoration:const BoxDecoration(
            shape: BoxShape.circle,
            image:DecorationImage(image: AssetImage("assets/images/myself1.jpg"), fit: BoxFit.contain)
          ),
        )));
