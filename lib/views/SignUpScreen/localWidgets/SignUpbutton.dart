import 'package:flutfire/controllers/AuthController.dart';
import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class buttonsSignup extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  const buttonsSignup(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.nameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _authController = Get.find<AuthController>();

    return Padding(
      padding: EdgeInsets.all(4.0.h),
      child: GetBuilder<AuthController>(
        init: AuthController(),
          builder:(controller) {
        
        return ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              String name = nameController.text.trim();
              String email = emailController.text.trim();
              String password = passwordController.text;
              controller.signUp(name, email, password);
            }
          },
          child: Text(
            'SIGN UP',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0.sp),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 31.0.w, vertical: 2.0.h),
            elevation: 8.8,
            primary: AppColors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(),
            ),
          ),
        );
      }),
    );
  }
}
