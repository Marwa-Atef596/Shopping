import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isCheck = false;
  var displayName = '';
  var displayPhoto = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isSigned = false;
  final GetStorage authBox = GetStorage();

  void visability() {
    isVisible = !isVisible;
    update();
  }

  void checkBox() {
    isCheck = !isCheck;
    update();
  }

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      isSigned = true;
      authBox.write('auth', isSigned);
      update();
      Get.offNamed(Routs.mainScreen);
    } on FirebaseAuthException catch (e) {
      String? title = e.code.replaceAll(RegExp('-'), ' ').capitalize;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.toString();
      }
      Get.snackbar(
        title!,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void logIn({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayName = auth.currentUser!.displayName!);

      isSigned = true;
      authBox.write('auth', isSigned);
      update();
      Get.offNamed(Routs.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword({
    required String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = e.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void googleSignUp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayName = googleUser!.displayName!;
      displayPhoto = googleUser.photoUrl!;

      isSigned = true;
      authBox.write('auth', isSigned);

      update();
      Get.offNamed(Routs.mainScreen);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      googleSignIn.signOut();
      displayName = '';
      displayPhoto = '';
      isSigned = false;
      authBox.remove('auth');
      update();
      Get.offNamed(Routs.welcomeScreen);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }
}
