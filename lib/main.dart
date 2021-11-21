import 'package:firebase_core/firebase_core.dart';

import 'package:flutfire/views/SplashScreen/Splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, 
    );
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
       
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Splashscreen(),
      );
    });
  }
}
