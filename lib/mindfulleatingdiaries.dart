import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_btn.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/personal_details.dart';

class MindfulEatingDiaryScreen extends StatelessWidget {
  const MindfulEatingDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MenuItem> items = [
      _MenuItem("Mindful Eating Diary", "assets/img_8.png", ),
      _MenuItem("History Eating Dairy", "assets/img_3.png", ),
      _MenuItem("List Feelings &\nTypes of Hunger", "assets/img_4.png", ),
      _MenuItem("Weight Loss\nWithout Diet", "assets/img_7.png", ),
      _MenuItem("Video’s", "assets/img_5.png", ),
      _MenuItem("Slim Slank Coach", "assets/img_6.png", ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.maincolor,
        title: createAppbarText("Mindful Eating Diary"),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.white,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(item.iconPath, height: 32, width: 32),
                      title: createMindfuldiaryText(item.title),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => item.targetPage),);
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 46, bottom: 60),
              child: CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Continue", (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => personalDetails()),);
              })
            )
          ],
        ),
      ),
    );
  }
}



class _MenuItem {
  final String title;
  final String iconPath;
  //final Widget targetPage;

  _MenuItem(this.title, this.iconPath, );
}
