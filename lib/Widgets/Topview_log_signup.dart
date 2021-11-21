import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class topview extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const topview({Key? key,  this.title,  this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title!,
            style: GoogleFonts.radley(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0.sp,
                color: AppColors.orange,
                wordSpacing: 1.0,
              ),
            ),
          ),
          SizedBox(height: 1.0.h),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 16.0.sp,
              color: AppColors.black,
              letterSpacing: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
