import 'package:flutfire/utils/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class textfilds extends StatelessWidget {
  final String? hinttext;
  final validator;
  final bool? obscure;
  final TextEditingController? controller;
  final Widget? preicon;
  final Widget? suffixicon;

  const textfilds({
    Key? key,
    this.hinttext,
    this.validator,
    this.obscure = false,
    this.controller,
    this.preicon,
    this.suffixicon,
  }) : super(key: key);

 


 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0.h),
      child: TextFormField(
        
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: obscure!,
        decoration: InputDecoration(
         
          
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
          prefixIcon: preicon,
          suffixIcon: suffixicon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.orange, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red,width: 2),
          ),
           focusedErrorBorder:  OutlineInputBorder(
          borderSide:  BorderSide(color: AppColors.red,width: 2),
         
        ),
        ),
        cursorHeight: 22.0,
        cursorColor: Colors.orange,
        
        
        style: TextStyle(color: Colors.white),
        autofocus: false,
        validator: validator,
      ),
    );
  }
}
