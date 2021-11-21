import 'package:flutfire/Widgets/Textfields.dart';
import 'package:flutfire/Widgets/Topview_log_signup.dart';
import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutfire/views/SignInScreen/SignInScreen.dart';
import 'package:flutfire/views/SignUpScreen/localWidgets/SignUpbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  bool isobs = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              topview(
                title: 'Welcome!',
                subtitle: 'Firebase Authentication',
              ),
              SizedBox(height: 1.0.h,),
             
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    textfilds(
                      preicon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      hinttext: 'Name',
                      controller: _nameController,
                      validator: (value) {
                        if (value.toString().length <= 2) {
                          return 'Enter valid name.';
                        }
                        return null;
                      },
                    ),
                    textfilds(
                      hinttext: 'Email',
                      preicon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
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
                    textfilds(
                      hinttext: 'Password',
                      obscure: isObscure,
                      suffixicon: IconButton(
                          color: Colors.white,
                          icon: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () => setState(() {
                                isObscure = !isObscure;
                              })),
                      controller: _passwordController,
                      validator: (value) {
                        if (value.toString().length < 6) {
                          return 'Password should be longer or equal to 6 characters.';
                        }
                        return null;
                      },
                    ),
                    textfilds(
                      hinttext: 'Confirm Password',
                      obscure: isobs,
                      validator: (value) {
                        if (value.trim() != _passwordController.text.trim()) {
                          return 'Passwords does not match!';
                        }

                        return null;
                      },
                      suffixicon: IconButton(
                          color: Colors.white,
                          icon: Icon(
                            isobs ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () => setState(() {
                                isobs = !isobs;
                              })),
                    ),
                    buttonsSignup(
                      formKey: _formKey,
                      nameController: _nameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                    ),
                    TextButton(
                      onPressed: () => Get.offAll(() => SignInScreen(),
                          transition: Transition.leftToRightWithFade),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: AppColors.white),
                          ),
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.orange),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '--or--',
                      style:
                          TextStyle(color: AppColors.white, fontSize: 17.0.sp),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton.mini(
                          buttonType: ButtonType.googleDark,
                          onPressed: () {},
                          elevation: 4.0,
                        ),
                        SignInButton.mini(
                          buttonType: ButtonType.facebookDark,
                          onPressed: () {},
                          elevation: 4.0,
                        ),
                      ],
                    ),
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
