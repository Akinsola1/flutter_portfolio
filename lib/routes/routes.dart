// TODO Implement this library.
import 'dart:js';

import 'package:my_portfolio/pages/components/hireMe/hireme.dart';
import 'package:my_portfolio/pages/homepage.dart';
import 'package:my_portfolio/utilities/import.dart';

import 'package:flutter/material.dart';
const String homepage = 'login';
const String hireMe = 'hireme';

Route <dynamic> controller (RouteSettings settings ) {

  switch (settings.name) {
    case homepage:
      return MaterialPageRoute(builder: (context) =>homePage());
      break;
      case hireMe: 
      return MaterialPageRoute(builder: (context) => hireme());
    default:
    throw('404');
  }
}