import 'package:flutfire/controllers/Splashcontroller.dart';
import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutfire/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.purple,
              body: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.splash,
                        height: 28.0.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
