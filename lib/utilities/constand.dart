import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(21, 181, 114, 1);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 2);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

const double kDesktopMaxWidth = 1000;
const double kTabletMaxWidth = 760;

double getMobilemaxWidth (BuildContext context ) => MediaQuery.of(context).size.width *8;