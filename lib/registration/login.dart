// lib/registration/Login.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert'; // Keep for json.encode/decode if needed elsewhere
import 'package:mindfuleatingapp/constants/constant_Text.dart';
import 'package:mindfuleatingapp/constants/constant_btn.dart';
import 'package:mindfuleatingapp/constants/constant_color.dart';
import 'package:mindfuleatingapp/mindfulleatingdiaries.dart';
import 'package:mindfuleatingapp/registration/signUp.dart';
import 'package:mindfuleatingapp/services/api_constant.dart';
import 'package:mindfuleatingapp/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'forgetPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscurePassword = true;
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  
  // UPDATED GOOGLE SIGN-IN INITIALIZATION
 final GoogleSignIn _googleSignIn = GoogleSignIn(
  serverClientId: '235994721272-dppqpkt3am38r6dciv1508folqemtulo.apps.googleusercontent.com', // Use serverClientId
  scopes: ['email', 'profile', 'openid'],
);

  Future<void> loginUser() async {
    setState(() => isLoading = true);

    try {
      final result = await _authService.login(
        emailController.text.trim(),
        passwordController.text,
      );

      if (result["success"]) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MindfulEatingDiaryScreen()),
        );
      } else {
        showErrorDialog(result["message"]);
      }
    } catch (e) {
      showErrorDialog('Connection Error: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> signInWithGoogle() async {
    setState(() => isLoading = true);
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in
        setState(() => isLoading = false);
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final String? idToken = googleAuth.idToken; // This is the ID Token to send to your backend

      if (idToken == null) {
        showErrorDialog('Failed to get Google ID Token.');
        setState(() => isLoading = false);
        return;
      }

      // --- ADDED LINE TO PRINT ID TOKEN ---
      print('Google ID Token (from Flutter): $idToken');
      // --- END ADDED LINE ---


      // Send ID Token to your backend
      final result = await _authService.googleSignIn(idToken);

      if (result["success"]) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MindfulEatingDiaryScreen()),
        );
      } else {
        showErrorDialog(result["message"]);
      }
    } catch (e) {
      // This catch block will tell you the actual error from Google Sign-In
      // e.g., PlatformException, Network error, etc.
      print('Google Sign-In Error (caught in Flutter): $e'); // Enhanced logging
      showErrorDialog('Google Sign-In Error: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createTextheading("Log in"),
              const SizedBox(height: 8),
              createsubheadingtext(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                Colors.grey,
              ),
              const SizedBox(height: 22),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.email, color: AppColors.maincolor),
                  suffixIcon:
                      Icon(Icons.email_outlined, color: Colors.transparent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock, color: AppColors.maincolor),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.maincolor,
                    ),
                    onPressed: () =>
                        setState(() => obscurePassword = !obscurePassword),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: createSimpleTextBtn(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Forgetpassword()));
                }, "Forget your password?"),
              ),
              const SizedBox(height: 25),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CreateBtn(
                      AppColors.primarybtncolor,
                      AppColors.primarytextColor,
                      "log in",
                      loginUser,
                    ),
              const SizedBox(height: 18),
              Center(
                child: Text("or",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )),
              ),
              const SizedBox(height: 18),
              createLinkBtn1(
                  signInWithGoogle, // This calls the Google Sign-In method
                  "Login With Google",
                  AppColors.primarytextColor,
                  AppColors.maincolor),
              const SizedBox(height: 15),
              createLinkBtn2(
                  () {}, "Login With Apple", AppColors.primarytextColor, Colors.black),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                        style: GoogleFonts.manrope(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400))),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: Text("Sign Up",
                          style: GoogleFonts.manrope(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                            color: AppColors.primarybtncolor,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}