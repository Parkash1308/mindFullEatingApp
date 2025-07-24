import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_btn.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';

class efectivetyShortterm extends StatefulWidget {
  const efectivetyShortterm({super.key});

  @override
  State<efectivetyShortterm> createState() => _efectivetyShorttermState();
}

class _efectivetyShorttermState extends State<efectivetyShortterm> {
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
          padding: EdgeInsets.only(left: 20, right:10, top: 100),
          child: Container(width: 355, height: 423,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createMindfuldiaryText3("Enter text about meal or snack"),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: 335, height: 250,
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
              CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Home", (){}),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CreateBtnSmall(AppColors.maincolor, AppColors.primarytextColor, "Explain", (){}),
                  CreateBtnSmall(Colors.black,AppColors.primarytextColor, "Next", (){})
                ],
              )
            ],
          ),),
        ),
      ),
    );
  }
}
