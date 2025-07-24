import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_btn.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/registration/change_password.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  final List<TextEditingController> controllers = List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.maincolor,
        title: createAppbarText("OTP Verification"),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.white,),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createTextheading("OTP Verification"),
            SizedBox(height: 8,),
            createsubheadingtext("We just sent you an SMS with 4-digit code. looks like very soon you will be logged in!", Colors.grey),
            SizedBox(height: 32),
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => _buildOtpBox(context, controllers[index], index),),),
            SizedBox(height: 30),
            Center( child: createOtpcounterText("60 Seconds"),),
            Padding(padding: EdgeInsets.only(top: 36, bottom: 36), child:   CreateBtn(AppColors.primarybtncolor, AppColors.primarytextColor, "Verify", (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => changepass()));
            }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox(BuildContext context, TextEditingController controller, int index) {
    return SizedBox(
      width: 55,
      child: TextField(
        controller: controller,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style:  TextStyle(fontSize: 24),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counterText: "",
          contentPadding:  EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
