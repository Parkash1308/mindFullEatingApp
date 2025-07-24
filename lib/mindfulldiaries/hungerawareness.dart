import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/constants/widgets.dart';

class hungerawareness extends StatefulWidget {
  const hungerawareness({super.key});

  @override
  State<hungerawareness> createState() => _hungerawarenessState();
}

class _hungerawarenessState extends State<hungerawareness> {
  List<String> thirdPageItems = ['hunger awareness before', 'hunger awareness during', 'hunger awareness after'];
  List<String> thirdPageImages = ['assets/img_19.png', "assets/img_20.png", 'assets/img_21.png'];

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
        padding: const EdgeInsets.only(top: 200, bottom: 100),
        child: buildListView(thirdPageItems, thirdPageImages),
      ),
    );
  }
}
