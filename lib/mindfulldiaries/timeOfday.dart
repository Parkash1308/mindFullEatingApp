import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/constants/widgets.dart';

class timeDays extends StatefulWidget {
  const timeDays({super.key});

  @override
  State<timeDays> createState() => _timeDaysState();
}

class _timeDaysState extends State<timeDays> {
  List<String> firstPageItems = ['Time of day', 'Meal or snack?'];
  List<String> firstPageImages = ['assets/img_9.png', "assets/img_15.png"];


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
      body: Padding(
        padding: const EdgeInsets.only(top: 270),
        child: buildListView(firstPageItems, firstPageImages),
      ),
    );
  }
}

