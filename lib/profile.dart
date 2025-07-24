import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_btn.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/dashboard.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final TextEditingController _dateController =
  TextEditingController(text: DateFormat('dd/MM/yyyy').format(DateTime.now()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.maincolor,
        title: createAppbarText("Profile"),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.white,),),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar( radius: 50, backgroundImage: AssetImage('assets/profile.png'),),
                    Positioned( bottom: 4, right: 4, child: CircleAvatar(radius: 14, backgroundColor: Colors.blue,
                        child: Icon(Icons.edit, size: 16, color: Colors.white),),),],),
              ),
              SizedBox(height: 22,),
              createsubheadingtext("Enter your name", Colors.black),
              SizedBox(height: 5,),
              createTextFeild("Enter name", Colors.grey,Icon(Icons.person, color: AppColors.maincolor), Icon(Icons.email_outlined ,color: Colors.transparent), false),
              SizedBox(height: 15,),
              createsubheadingtext("Enter your email", Colors.black),
              SizedBox(height: 5,),
              createTextFeild("Enter email", Colors.grey,Icon(Icons.email, color: AppColors.maincolor), Icon(Icons.email_outlined ,color: Colors.transparent), false),
              SizedBox(height: 15,),
              createsubheadingtext("Your date of birth", Colors.black),
              SizedBox(height: 5,),
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.calendar_month_rounded, color: AppColors.maincolor,),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                  enabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.transparent, width: 2.0), ),// Normal border color
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 2.0), // Custom focus color
                  ),
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2050),
                  );
                  if (picked != null) {
                    _dateController.text =
                        DateFormat('dd/MM/yyyy').format(picked);
                  }
                },
              ),

              SizedBox(height: 22,),
              Padding(
                  padding: EdgeInsets.only(top: 150,),
                  child: CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Done", (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => dashboard()),);
                  })
              )
          ],
        ),),
      ),
    );
  }
}

