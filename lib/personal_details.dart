import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_btn.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/profile.dart';

class personalDetails extends StatefulWidget {
  const personalDetails({super.key});

  @override
  State<personalDetails> createState() => _personalDetailsState();
}

class _personalDetailsState extends State<personalDetails> {
  String? selectedHeight;
  String? selectedWeight;
  String? selectedAge;
  String selectedGender = 'Male';
  final neonColor = Colors.cyanAccent; // Neon color dot


  // Dynamically generate height options from 140 to 220 cm
  final List<String> heightOptions = List.generate(
    81, // 220 - 140 + 1
        (index) => '${140 + index} cm',
  );

  // Dynamically generate height options from 140 to 220 cm
  final List<String> weightOptions = List.generate(
    1000, // 220 - 140 + 1
        (index) => '${10 + index} KG',
  );

  // Age options from 5 to 100
  final List<String> ageOptions = List.generate(
    96, // 100 - 5 + 1
        (index) => '${5 + index} years',
  );



  Widget buildGenderOption(String gender) {
    final isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primarybtncolor:  Colors.grey,
                width: 1,
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
          SizedBox(height: 5),
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
        title: createAppbarText("Personal Details"),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.white,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createPersonalDetailssubheadingtext("What is your height?", Colors.black),
            SizedBox(height: 22,),
            DropdownButtonFormField<String>(
              decoration: InputDecoration( labelText: "Height", floatingLabelStyle: TextStyle(color: Colors.transparent), contentPadding: EdgeInsets.only(bottom: 2, left: 5),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
              value: selectedHeight,
              items: heightOptions.map((height) {
                return DropdownMenuItem<String>(
                  value: height,
                  child: Text(height),); }).toList(), onChanged: (value) { setState(() {selectedHeight = value; });
              },
            ),
            SizedBox(height: 20,),
            createPersonalDetailssubheadingtext("What is your weight?", Colors.black),
            SizedBox(height: 22,),
            DropdownButtonFormField<String>(
              decoration: InputDecoration( labelText: "Weight", floatingLabelStyle: TextStyle(color: Colors.transparent),
                contentPadding: EdgeInsets.only(bottom: 2, left: 5),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
              value: selectedWeight,
              items: weightOptions.map((height) {
                return DropdownMenuItem<String>(
                  value: height,
                  child: Text(height),); }).toList(), onChanged: (value) { setState(() {selectedWeight = value; });
            },
            ),
            SizedBox(height: 20,),
            createPersonalDetailssubheadingtext("What is your age?", Colors.black),
            SizedBox(height: 22,),
            DropdownButtonFormField<String>(
              decoration: InputDecoration( labelText: "Age", floatingLabelStyle: TextStyle(color: Colors.transparent),contentPadding: EdgeInsets.only(bottom: 2, left: 5),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 2.0),),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),
              value: selectedAge,
              items: ageOptions.map((height) {
                return DropdownMenuItem<String>(
                  value: height,
                  child: Text(height),); }).toList(), onChanged: (value) { setState(() {selectedAge = value; });

            },
            ),
            SizedBox(height: 22,),
            createMindfuldiaryText("Gender"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildGenderOption("Male"),
                buildGenderOption("Female"),
                buildGenderOption("Other"),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 100,), child:   CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Continue", (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
            }),
            )
          ],
        ),
      ),
    );
  }
}
