import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutfire/ComonDailog/Error_dailogController.dart';
import 'package:flutfire/views/HomeScreen/HomeScreen.dart';
import 'package:flutfire/views/SignInScreen/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUp(String name, String email, String password) async {
    try {
      ComanDailog.showLoading();
      await auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      ComanDailog.hideLoading();
      Get.off(() => SignInScreen(), transition: Transition.rightToLeftWithFade);
      update();
    } on FirebaseAuthException catch (e) {
      ComanDailog.hideLoading();
      //String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      // String message = '';
      if (e.code == 'Weak-Password') {
        ComanDailog.showErrorDailog(
            description: "The password provided is too weak");
        //message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        ComanDailog.showErrorDailog(
            description: "The account already exists for that email");
        // message = ('The account already exists for that email');
      }
    } catch (e) {
      ComanDailog.hideLoading();
      ComanDailog.showErrorDailog(description: "Something went wrong");
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      ComanDailog.showLoading();
      await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      ComanDailog.hideLoading();
      Get.off(() => HomeScreen(), transition: Transition.fadeIn);
      update();
    } on FirebaseAuthException catch (e) {
      ComanDailog.hideLoading();

      if (e.code == 'wrong-password') {
        ComanDailog.showErrorDailog(
            description: "Wrong password provided for that user");
      } else if (e.code == 'user-not-found') {
        ComanDailog.showErrorDailog(
            description: "No user found for that email");
      }
    }
  }

  // Future<void> resetPassword(String email) async {
  //   try {
  //     await auth.sendPasswordResetEmail(email: email);
  //     Get.snackbar('Sending', 'Password Reset Email has been sent !',
  //         backgroundColor: Colors.black, colorText: Colors.orange);

  //     Get.offAll(() => SignInScreen(), transition: Transition.leftToRight);
  //     update();
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'User-not-found') {
  //       Get.snackbar('oops', 'user not found !',
  //           backgroundColor: Colors.black, colorText: Colors.orange);
  //     }
  //   }
  // }

  Future<void> SignOut() async {
    try {
      ComanDailog.showLoading();

      await auth.signOut();
      Get.offAll(SignInScreen(), transition: Transition.topLevel);
      ComanDailog.hideLoading();
      update();
    } catch (e) {
      ComanDailog.hideLoading();
      ComanDailog.showErrorDailog(description: "Something went wrong");
    }
  }

  void deleteuseraccount(String emails, String pass) async {
    User? user = await auth.currentUser;
    AuthCredential credential =
        EmailAuthProvider.credential(email: emails, password: pass);
    await user!.reauthenticateWithCredential(credential).then((value) {
      value.user!.delete().then((res) {
        Get.offAll(()=>SignInScreen());
        Get.snackbar("User Account Deleted ", "Success",backgroundColor: Colors.orangeAccent);
      });
      update();
    // ignore: invalid_return_type_for_catch_error
    }).catchError((onError) => Get.snackbar("Credential Error", "Failed",backgroundColor: Colors.orangeAccent));
  }
}
