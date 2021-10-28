import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/components/header.dart';

class HeaderItem{
  final String title;
  final VoidCallback onTap;
  final bool isButton;
  HeaderItem({this.isButton = false, required this.onTap,required this.title});  
}