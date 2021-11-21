import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfire/controllers/AuthController.dart';
import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutfire/views/HomeScreen/ChangedPassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final email = FirebaseAuth.instance.currentUser!.email;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();

      Get.snackbar('Send', 'Verification Email has been sent',backgroundColor: Colors.orangeAccent);

    }
  }

  TextEditingController emails = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_authController) {
      return Scaffold(
        backgroundColor: AppColors.purple,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.purple,
          title: Text(
            'FlutFire',
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                user!.emailVerified
                    ? Text(
                        'verified $email',
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                      )
                    : TextButton(
                        onPressed: () => {verifyEmail()},
                        child: Text('Verify Email')),
                ElevatedButton.icon(
                  onPressed: () {
                    _authController.SignOut();
                  },
                  icon: (Icon(Icons.logout_sharp)),
                  label: Text('LOGOUT'),
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => ChangedPassword());
                    },
                    child: Text('Changed password')),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.dialog(Dialog(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                cursorColor: Colors.black,
                                cursorHeight: 26.0,
                                controller: emails,
                                decoration: InputDecoration(
                                  hintText: 'Email...',
                                ),
                              ),
                              SizedBox(height: 1.0.h),
                              TextField(
                                cursorColor: Colors.black,
                                cursorHeight: 26.0,
                                obscureText: true,
                                controller: pass,
                                decoration: InputDecoration(
                                  hintText: 'Password...',
                                ),
                              ),
                              SizedBox(height: 1.0.h),
                              TextButton(
                                onPressed: () {
                                  _authController.deleteuseraccount(
                                      emails.text, pass.text);
                                },
                                child: Text(
                                  'Confirm delete!',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15.0.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13.0.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.2.h, horizontal: 23.0.w),
                      // padding: EdgeInsets.symmetric(horizontal: 23.0.w, vertical: 0.5.h),
                      elevation: 0.0,
                      primary: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
