import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ComanDailog {
  static showLoading({String title = "Loading..."}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0.h),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.7.h),
          child: Container(
            height: 2.2.h,
            child: Row(
              children: [
                SizedBox(width: 5.0.w),
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(width: 5.0.w),
                Text(title),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static hideLoading() {
    Get.back();
  }

  static showErrorDailog(
      {String title = "Oops Error",
      String description = "Something went wrong"}) {
    Get.dialog(Dialog(
      backgroundColor: Colors.white,
      elevation: 8.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0.w))),
          child: Padding(padding: EdgeInsets.all(6.0.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,color: Colors.red),
              
              ),
              SizedBox(height: 2.0.h),
              Text(
                description,
                style: TextStyle(fontSize: 12.0.sp,color: Colors.black),
              ),
              SizedBox(height: 2.0.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 4.0.h, vertical: 2.0.h),
                  
                ),
                onPressed: (){
                    if (Get.isDialogOpen!) Get.back();
                },
                child: Text("Okay",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
              ),
            ],
          ),
          
          ),
    ),
    barrierDismissible: false,
    );
  }
}
