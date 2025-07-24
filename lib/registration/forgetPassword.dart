import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/registration/OTP-verification.dart';

import '../constants/constant_btn.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.maincolor,
        title: createAppbarText("Forget your password"),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.white,),),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 24,left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createTextheading("Forget your password"),
              SizedBox(height: 8,),
              createsubheadingtext("Don’t worry, it happens to the best of us! We’ll help you reset your password.", Colors.grey),
              SizedBox(height: 22,),
              createsubheadingtext("Enter you email", Colors.black),
              SizedBox(height: 22,),
              createTextFeild("Enter your email", Colors.grey,Icon(Icons.email, color: AppColors.maincolor), Icon(Icons.email_outlined ,color: Colors.transparent), false),
              SizedBox(height: 22,),
              Padding(padding: EdgeInsets.only(top: 36, bottom: 36),
                child: CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Continue", (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen()));
                }),)
            ],
          ),
      ))
    );
  }
}
