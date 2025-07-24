import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/registration/login.dart';
import 'package:mindfuleatingapp/registration/splashscreens/splashscreen1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SplashScreen1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container( height: 262, width: 225,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo.png"))),), // Your logo
        )
    );
  }
}
