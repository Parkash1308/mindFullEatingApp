import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_btn.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/registration/login.dart';

class lastscreen extends StatefulWidget {
  const lastscreen({super.key});

  @override
  State<lastscreen> createState() => _lastscreenState();
}

class _lastscreenState extends State<lastscreen> {
  String selectedGender = 'Male';
  final neonColor = Colors.cyanAccent;



  Widget buildPriorityOption(String gender) {
    final isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primarybtncolor:  Colors.grey,
                width: 2,
              ),
            ),
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primarybtncolor : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
              gender,
              style: GoogleFonts.manrope(textStyle: TextStyle(
                color: isSelected ? AppColors.primarybtncolor : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,

              ),)
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.maincolor,
        title: createAppbarText("Mindful eating diary"),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.white,),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createsubheadingtext("Your first name", Colors.black),
              SizedBox(height: 10,),
              createTextFeild("Enter Here", Colors.grey,Icon(Icons.person_outlined, color: Colors.grey[600]), Icon(Icons.person_outlined ,color: Colors.transparent), false),
              SizedBox(height: 10,),
              createsubheadingtext("Your last name", Colors.black),
              SizedBox(height: 10,),
              createTextFeild("Enter Here", Colors.grey,Icon(Icons.person_outlined, color: Colors.grey[600]), Icon(Icons.email_outlined ,color: Colors.transparent), false),
              SizedBox(height: 10,),
              createsubheadingtext("Your email address", Colors.black),
              SizedBox(height: 10,),
              createTextFeild("Enter Here", Colors.grey,Icon(Icons.email_outlined, color: Colors.grey[600]), Icon(Icons.email_outlined ,color: Colors.transparent), false),
              SizedBox(height: 10,),
              createMindfuldiaryText("Priority"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildPriorityOption("High"),
                  buildPriorityOption("Mediam"),
                  buildPriorityOption("low"),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: 335, height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    // controller: _controller,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: 'Enter text...',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
                 CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Only by Email", (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
              }),
        
            ],
          ),
        ),
      ),
    );
  }
}


