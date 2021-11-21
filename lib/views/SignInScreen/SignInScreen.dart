import 'package:flutfire/Widgets/Textfields.dart';
import 'package:flutfire/Widgets/Topview_log_signup.dart';
import 'package:flutfire/views/SignInScreen/Forgotpassword.dart';
import 'package:flutfire/views/SignInScreen/localWidget/LoginButon.dart';
import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutfire/views/SignUpScreen/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:sign_button/sign_button.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: SingleChildScrollView(
          child: Column(
            children: [
              topview(
                title: 'Welcome!',
                subtitle: 'Firebase Authentication',
              ),
              SizedBox(height: 10.0.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
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
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Get.to(ForgotPassword(),
                            transition: Transition.rightToLeftWithFade),
                        style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => AppColors.orange)),
                      ),
                    ),
                    buttons(
                      formKey: _formKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpScreen(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: AppColors.white),
                          ),
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Text(
                            'Sign up',
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
                    SizedBox(
                      height: 1.0.h,
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
