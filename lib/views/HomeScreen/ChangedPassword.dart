import 'package:flutfire/views/SignInScreen/SignInScreen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfire/Widgets/Textfields.dart';
import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangedPassword extends StatefulWidget {
  @override
  State<ChangedPassword> createState() => _ChangedPasswordState();
}

class _ChangedPasswordState extends State<ChangedPassword> {
  final _formKey = GlobalKey<FormState>();

  var newPassword = "";
  final newPasswordController = TextEditingController();
  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentUser = FirebaseAuth.instance.currentUser;
  changePassword() async {
    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Get.to(() => SignInScreen());

      Get.snackbar('Changed', 'Your Password has been Changed. Login again !',
          backgroundColor: Colors.orangeAccent);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.purple,
          appBar: AppBar(
            backgroundColor: AppColors.purple,
            title: Text('Changed Password'),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 1.0.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  textfilds(
                    hinttext: ' Enter New Password',
                    preicon: Icon(Icons.email, color: Colors.white),
                    controller: newPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
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
                              setState(() {
                                newPassword = newPasswordController.text;
                              });
                              changePassword();
                            }
                          },
                          child: Text(
                            'Changed Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13.0.sp),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.2.h, horizontal: 23.0.w),
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
          )),
    );
  }
}
