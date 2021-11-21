import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfire/Widgets/Textfields.dart';
import 'package:flutfire/controllers/AuthController.dart';
import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutfire/views/SignInScreen/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();

    var email = "";

    resetPassword() async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Get.snackbar('Sending', 'Password Reset Email has been sent !',backgroundColor: Colors.orangeAccent);
       
        Get.offAll(() => SignInScreen(), transition: Transition.leftToRight);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
         Get.snackbar('nope', 'No user found for that email.',backgroundColor: Colors.orangeAccent);
          
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.purple,
          title: Text('Reset Password'),
        ),
        body: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (controller) {
              return Container(
                padding: EdgeInsets.only(top: 1.0.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Reset Link will be sent to your email id !',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 2.0.h),
                      textfilds(
                        hinttext: 'Enter your Email',
                        preicon: Icon(Icons.email, color: Colors.white),
                        controller: _emailController,
                        validator: (value) {
                          bool _isEmailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          if (!_isEmailValid) {
                            return 'Invalid email.';
                          }
                          return null;
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0.h),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  email = _emailController.text.trim();
                                  resetPassword();
                                }
                              },
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0.sp),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.4.h, horizontal: 23.0.w),
                                // padding: EdgeInsets.symmetric(horizontal: 23.0.w, vertical: 0.5.h),
                                elevation: 8.8,
                                primary: AppColors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
