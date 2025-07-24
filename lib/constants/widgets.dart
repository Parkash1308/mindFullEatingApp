import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';

buildDashboardCard(String ImagePath, String title, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: Colors.white,
     // elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(height: 60, width: 60, decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImagePath))),),
          SizedBox(height: 10),
          createMindfuldiaryText2(title)
        ],
      ),
    ),
  );
}

Widget buildListView(List<String> items, List<String> ImagePath, ) {

  return ListView.separated(
    padding: EdgeInsets.all(16),
    itemCount: items.length,
    separatorBuilder: (_, __) => const SizedBox(height: 12),
    itemBuilder: (context, index) {

     // final item = items[index];
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
          leading: Image.asset(ImagePath[index] , height: 32, width: 32),
          title: createMindfuldiaryText(items[index]),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => item.targetPage),);
          },
        ),
      );
    },
  );
}
