import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/shared/firebase_auth.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/app.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/onbording_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/sign_in_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/sign_up_page.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  User? userData;
  var mainloading = false.obs;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  var obscured = false.obs;
  var rememberme = false.obs;
  final formKey = GlobalKey<FormState>();
  var emailCo = TextEditingController().obs;
  var passwordCo = TextEditingController().obs;

  final textFieldFocusNode = FocusNode();

  void toggleObscured() {
    obscured.value = !obscured.value;
    if (textFieldFocusNode.hasPrimaryFocus)
      return; // If focus is on text field, dont unfocus
    textFieldFocusNode.canRequestFocus = false;
  }

  void rememberMe() {
    if (rememberme.value) {
      rememberme.value = !rememberme.value;
    } else {
      rememberme.value = true;
    }
  }

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    var duration = const Duration(seconds: 2);
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      return Timer(duration, () {
        // Additionally, you can check the current user status immediately

        Get.offAll(() => OnbordingPage());
      });
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      return Timer(duration, () {
        // Additionally, you can check the current user status immediately

        Get.offAll(() => const AppScreen());
      });
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => OnbordingPage());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => const AppScreen());
    }
  }

  void signInWithGoogle() async {
    mainloading(true);
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
        mainloading(false);
      }
    } catch (e) {
      mainloading(false);
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void register() async {
    mainloading(true);
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailCo.value.text, password: passwordCo.value.text);
      mainloading(false);
    } catch (firebaseAuthException) {
      mainloading(false);
      Get.snackbar(
        "Error",
        "Pastikan anda menggunakan akun Gmail !",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login() async {
    mainloading(true);
    try {
      await auth.signInWithEmailAndPassword(
          email: emailCo.value.text, password: passwordCo.value.text);
      mainloading(false);
    } catch (firebaseAuthException) {
      mainloading(false);
      Get.snackbar(
        "Error",
        "Pastikan anda menggunakan akun Gmail !",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    mainloading(
        true); // Set mainloading to true when starting the logout process

    try {
      await auth.signOut();
    } catch (e) {
      print("Error during sign out: $e");
    } finally {
      mainloading(
          false); // Set mainloading back to false once logout is done (or if there's an error)
    }
  }
}
