import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';

createTextheading(String normaltext,) {
  return Text(normaltext, textAlign: TextAlign.start,
    style: GoogleFonts.manrope(
      textStyle: TextStyle(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24, letterSpacing: -2, ),));
}

createsubheadingtext(String normaltext, Color textcolor){
  return Text(normaltext, textAlign: TextAlign.start, style: GoogleFonts.poppins(
    textStyle: TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14,letterSpacing: -0.41, color: textcolor
    )
  ),);
}


createTextFeild(String inputText,Color hintcolor, Icon preicon, Icon suficon, bool obscureText,){
  return     TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      prefixIcon: preicon,
      suffixIcon: suficon,
      hintText: inputText,
      hintStyle: TextStyle(color: hintcolor),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
      enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.transparent, width: 2.0), ),// Normal border color
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 2.0), // Custom focus color
      ),
    ),
  );
}

createSimpleTextBtn(VoidCallback ontap, String inputtext){
  return TextButton(onPressed: ontap,
      child: Text (inputtext, textAlign: TextAlign.end
        ,style: TextStyle(color: AppColors.maincolor, fontWeight: FontWeight.bold),)
  );
}

createAppbarText(String normaltext, ){
  return Text(normaltext, textAlign: TextAlign.start, style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.primarytextColor
      )
  ),);
}


createMindfuldiaryText(String normaltext, ){
  return Text(normaltext, textAlign: TextAlign.start, style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black
      )
  ),);
}

createPersonalDetailssubheadingtext(String normaltext, Color textcolor){
  return Text(normaltext, textAlign: TextAlign.start, style: GoogleFonts.manrope(
      textStyle: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 14, color: textcolor,
      )
  ),);
}

createOtpcounterText(String normaltext, ){
  return Text(normaltext, textAlign: TextAlign.start, style: GoogleFonts.inter(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.maincolor
      )
  ),);
}

createMindfuldiaryText2(String normaltext, ){
  return Text(normaltext, textAlign: TextAlign.center, style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black
      )
  ),);
}

createMindfuldiaryText3(String normaltext, ){
  return Text(normaltext, textAlign: TextAlign.start, style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black
      )
  ),);
}