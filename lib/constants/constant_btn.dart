import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CreateBtn(Color splashcolor, Color textcolor, String text, VoidCallback ontap){
  return  GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only( top: 10, bottom: 10),
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
          color: splashcolor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text(text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: textcolor,
              fontWeight: FontWeight.w500, fontSize: 16), )),
      ),
    ),
  );
}

createLinkBtn1(VoidCallback ontap, String inputText, Color smalltextcolor,  Color bgColor){
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only( top: 10, bottom: 10),
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 20, width: 20, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img.png"))),), // Icon color matches text
          SizedBox(width: 10),
          Text(inputText,style: GoogleFonts.poppins(textStyle: TextStyle(color: smalltextcolor,)) ),
        ],
      ),
    ),
  );
}

createLinkBtn2(VoidCallback ontap, String inputText, Color smalltextcolor,  Color bgColor){
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only( top: 10, bottom: 10),
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 20, width: 20, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_1.png"))),), // Icon color matches text
          SizedBox(width: 10),
          Text(inputText,style: GoogleFonts.poppins(textStyle: TextStyle(color: smalltextcolor,)) ),
        ],
      ),
    ),
  );
}

CreateBtnSmall(Color splashcolor, Color textcolor, String text, VoidCallback ontap){
  return  GestureDetector(
    onTap: ontap,
    child: Container(
     // margin: EdgeInsets.only( top: 10, ),
      height: 52,
      width: 155,
      decoration: BoxDecoration(
          color: splashcolor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text(text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: textcolor,
                  fontWeight: FontWeight.w500, fontSize: 16), )),
      ),
    ),
  );
}