import 'package:flutter/material.dart';
Widget mButton(BuildContext context,String buttonName){
  Size size=MediaQuery.of(context).size;
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(35),
    child: Container(
      alignment: Alignment.center,
      height: size.height*.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.blue,
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: size.height*.03,
        ),
      ),
    ),
  );
}
Widget button(BuildContext context,String buttonName,Color buttonColor,Color txtColor){
  Size size=MediaQuery.of(context).size;
  return Material(
    elevation: 2,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      alignment: Alignment.center,
      height: size.height*.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          color: txtColor,
          fontWeight: FontWeight.w800,
          fontSize: size.height*.03,
        ),
      ),
    ),
  );
}