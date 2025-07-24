import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/constant_Text.dart';
import '../constants/constant_btn.dart';
import '../constants/constant_color.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Padding(padding: EdgeInsets.only(top: 64,left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createTextheading("Sign Up"),
              SizedBox(height: 8,),
              createsubheadingtext("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", Colors.grey),
              SizedBox(height: 24,),
              createTextFeild("Enter your name", Colors.grey,Icon(Icons.person, color: AppColors.maincolor), Icon(Icons.email_outlined ,color: Colors.transparent), false),
              SizedBox(height: 16,),
              createTextFeild("Enter your email", Colors.grey,Icon(Icons.email, color: AppColors.maincolor), Icon(Icons.email_outlined ,color: Colors.transparent), false),
              SizedBox(height: 16,),
              createTextFeild("Enter your password", Colors.grey,Icon(Icons.lock, color: AppColors.maincolor), Icon(Icons.visibility_off ,color: AppColors.maincolor), true),
              SizedBox(height: 25,),
              CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Sign Up", (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              }),
              SizedBox(height: 18,),
              Row(children: [
                Expanded(child: Divider()),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text("or", style:  GoogleFonts.inter(textStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),)),),
              Expanded(child: Divider()),],),
              SizedBox(height: 18,),
              createLinkBtn1((){}, "Login With Google",  AppColors.primarytextColor, AppColors.maincolor),
              SizedBox(height: 15,),
              createLinkBtn2((){}, "Login With Apple", AppColors.primarytextColor, Colors.black),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Already have an account? ", style: GoogleFonts.manrope(textStyle:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  }, child: Text("Log in",  style: GoogleFonts.manrope(textStyle:  TextStyle(fontSize: 16, fontWeight: FontWeight.w400), color: AppColors.primarybtncolor)))
                ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

