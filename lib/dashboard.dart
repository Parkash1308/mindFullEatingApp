import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_btn.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/mindfulldiaries/mindfulldiary.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.maincolor,
        title: createAppbarText("Dashboard"),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.white,),),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createMindfuldiaryText("Dashboard"),
          SizedBox(height: 5,),
          Container(height: 375, width: 355,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/img_23.png"))
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              createMindfuldiaryText("Weight log overview"),
              TextButton(onPressed: (){}, child: Text("See all", style: TextStyle(fontSize: 12,color: Colors.blue, fontWeight: FontWeight.w400),)),
            ],
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(width: 25, height: 25, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/img_24.png"))),),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('73.3', style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, ),)),
                          Text('Weight (kg)', style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),)),
                        ],
                      ),
                      Spacer(),
                      Text('16, May 2025',style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black),)),
                    ],
                  ),
                );
              },
            ),
          ),
         CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Done", (){Navigator.push(context, MaterialPageRoute(builder: (context) => mindfulleating()));})
        ],
      ),),
    );
  }
}
