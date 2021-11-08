import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/pages/components/stats/stat.dart';
import 'package:my_portfolio/utilities/constand.dart';
import 'package:my_portfolio/utilities/screen_detector.dart';
import 'package:responsive_framework/responsive_wrapper.dart';


final List<Stat> stats = [
  Stat(count: "3", text: "Clients"),
  Stat(count: "25+", text: "Projects"),
  Stat(count: "4", text: "Certificate"),
  Stat(count: "2", text: "Years\nExperience"),
];
class portfolioState extends StatelessWidget {
  const portfolioState({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: screenDetector(
      mobile: _buildUi(MediaQuery.of(context).size.width * .8, context),
      tablet: _buildUi(760, context),
      desktop: _buildUi(1000, context),
    )
    );
  }

  Widget _buildUi (double width, BuildContext context){
    return Container(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraint){
          return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: stats.map((stat) { 
              int index = stats.indexOf(stat);
              return Container(
                padding: EdgeInsets.symmetric(vertical: 15),
              width: screenDetector.isMobile(context) ? constraint.maxWidth / 2.0 - 20 : (constraint.maxWidth / 4.0 - 20),
              height: 100,  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stats[index].count,
                    style: GoogleFonts.oswald(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    stats[index].text,
                    style: GoogleFonts.oswald(
                      fontSize: 16,
                      color: kCaptionColor,
                    ),
                  )
                ],
              ),
            );
            }
            ).toList()
          );
        }),
      ),
    );
  }
}