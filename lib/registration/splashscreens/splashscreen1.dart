import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';

import '../login.dart';

class SplashScreen1 extends StatefulWidget {
  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.maincolor, // or any color you want
      body: Container(
        height: double.infinity, width: double.infinity, decoration: BoxDecoration(color: AppColors.maincolor, image: DecorationImage(image: AssetImage("assets/img_22.png"))),
        child: Center(
          child: Container( height: 262, width: 225,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo.png"))),), // Your logo
        ),
      )
    );
  }
}
