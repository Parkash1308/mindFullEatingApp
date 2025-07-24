import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/constants/widgets.dart';

class TypeOfHunger extends StatefulWidget {
  const TypeOfHunger({super.key});

  @override
  State<TypeOfHunger> createState() => _TypeOfHungerState();
}

class _TypeOfHungerState extends State<TypeOfHunger> {
  List<String> secondPageItems = ['Thoughts before eating', 'Thoughts after eating', 'Type of hunger'];
  List<String> secondPageImages = ['assets/img_16.png', "assets/img_17.png", "assets/img_18.png"];

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
        child: buildListView(secondPageItems, secondPageImages),
      ),
    );
  }
}
