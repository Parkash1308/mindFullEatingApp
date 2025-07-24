import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/mindfulleatingdiaries.dart';
import 'package:mindfuleatingapp/registration/OTP-verification.dart';

import '../constants/constant_Text.dart';
import '../constants/constant_btn.dart';
import '../constants/constant_color.dart';

class changepass extends StatefulWidget {
  const changepass({super.key});

  @override
  State<changepass> createState() => _changepassState();
}

class _changepassState extends State<changepass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.maincolor,
          title: createAppbarText("Change password"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.only(top: 24,left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createTextheading("Change Password"),
                  SizedBox(height: 8,),
                  createsubheadingtext("Your new password must be different from previous used password.", Colors.grey),
                  SizedBox(height: 22,),
                  createsubheadingtext("Enter you new password", Colors.black),
                  SizedBox(height: 15,),
                  createTextFeild("Enter your new password", Colors.grey,Icon(Icons.email, color: AppColors.maincolor), Icon(Icons.visibility_off,color: AppColors.maincolor), true),
                  SizedBox(height: 22,),
                  createsubheadingtext("Confirm your password", Colors.black),
                  SizedBox(height: 15,),
                  createTextFeild("Confirm your password", Colors.grey,Icon(Icons.email, color: AppColors.maincolor), Icon(Icons.visibility_off,color: AppColors.maincolor), true),
                  SizedBox(height: 22,),
                  Padding(padding: EdgeInsets.only(top: 36, bottom: 36),
                    child: CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Reset your password", (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MindfulEatingDiaryScreen()));
                    }),)
                ],
              ),
            ))
    );
  }
}
