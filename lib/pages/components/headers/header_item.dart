import 'package:flutter/material.dart';

class HeaderItem{
  final String title;
  final VoidCallback onTap;
  final bool isButton;
  HeaderItem({this.isButton = false, required this.onTap,required this.title});  
}