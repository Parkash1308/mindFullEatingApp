import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/constants/widgets.dart';
import 'package:mindfuleatingapp/mindfulldiaries/efectivityShortterm.dart';
import 'package:mindfuleatingapp/mindfulldiaries/effectivetyLongterm.dart';
import 'package:mindfuleatingapp/mindfulldiaries/hungerawareness.dart';
import 'package:mindfuleatingapp/mindfulldiaries/notes.dart';
import 'package:mindfuleatingapp/mindfulldiaries/timeOfday.dart';
import 'package:mindfuleatingapp/mindfulldiaries/typeOfHunger.dart';

class mindfulleating extends StatefulWidget {
  const mindfulleating({super.key});

  @override
  State<mindfulleating> createState() => _mindfulleatingState();
}

class _mindfulleatingState extends State<mindfulleating> {
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
        padding: const EdgeInsets.only(top: 30,),
        child: Expanded(
            child: GridView.count( crossAxisCount: 2, padding: EdgeInsets.all(16.0),
                children: [
                  buildDashboardCard("assets/img_9.png", 'Time of day',  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => timeDays()),);
                  }),

                  buildDashboardCard("assets/img_10.png", 'Thoughts and \nTypes of Hunger',  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TypeOfHunger()),);
                  }),

                  buildDashboardCard("assets/img_11.png", 'Hunger \nAwareness',  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => hungerawareness()),);
                  }),

                  buildDashboardCard("assets/img_12.png", 'Effectivity Short \nTerm',  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => efectivetyShortterm()),);
                  }),

                  buildDashboardCard("assets/img_13.png", 'Effectivity Long \nTerm',  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => effectivityLongtern()),);
                  }),

                  buildDashboardCard("assets/img_14.png", 'Notes',  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => notes()),);
                  }),

                ]
            )
        ),
      ),
    );
  }
}
