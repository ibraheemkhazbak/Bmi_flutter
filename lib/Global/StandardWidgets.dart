import 'package:bmi_calculator/Global/Palette.dart';
import 'package:flutter/material.dart';

Text standardText(String text,{double fontSize=24,bool isBold=true,Color color=WHITE}){
return Text(text,style: TextStyle(
  fontSize: fontSize,
  fontWeight: isBold?FontWeight.bold:FontWeight.normal,
  color: color,
),textAlign: TextAlign.center,
);
}