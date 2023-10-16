import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/controllers/auth_controllers.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/sign_in_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/sign_up_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/colors_style.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/text_style.dart';
import 'package:get/get.dart';

class OnbordingPage extends StatelessWidget {
  final bloc = Get.put(AuthController());
  OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 200,
                  ),
                  Text(
                    "Let's you in",
                    style:
                        blackTextStyle.copyWith(fontSize: 17, fontWeight: bold),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.snackbar(
                  "Error",
                  "Comming soon in integration !",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      15), // Adjust for your desired radius
                  border: Border.all(
                    color: greyColor
                        .withOpacity(0.2), // This is the border (side) color
                    width: 1, // Adjust for your desired border width
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      color: Colors.white,
                      child: Image.asset(
                        "assets/fb.png",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Facebook",
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: bold))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                bloc.signInWithGoogle();
              },
              child: Container(
                margin: const EdgeInsets.all(17),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      15), // Adjust for your desired radius
                  border: Border.all(
                    color: greyColor
                        .withOpacity(0.2), // This is the border (side) color
                    width: 1, // Adjust for your desired border width
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                      child: Image.asset(
                        "assets/google.png",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Google",
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: bold))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.snackbar(
                  "Error",
                  "Comming soon in integration !",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      15), // Adjust for your desired radius
                  border: Border.all(
                    color: greyColor
                        .withOpacity(0.2), // This is the border (side) color
                    width: 1, // Adjust for your desired border width
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      color: Colors.white,
                      child: Image.asset(
                        "assets/ios.png",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("Apple",
                        style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: bold))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Or Continue with",
              style: greyTextStyle.copyWith(fontWeight: bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                    style: ButtonStyle(
                        // padding: MaterialStateProperty.all<EdgeInsets>(
                        //     const EdgeInsets.symmetric(
                        //         vertical: 15, horizontal: 40)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(blueColor2),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(whiteColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: blueColor2)))),
                    onPressed: () {
                      Get.to(SignPageScreen());
                    },
                    child: Text("Sign In with password",
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: bold))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Doesn’t have account?",
                  style: greyTextStyle.copyWith(fontWeight: bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignUpPageScreen());
                  },
                  child: Text(
                    "Sign Up",
                    style: blueTextStyle.copyWith(
                        fontWeight: medium, color: blueColor2),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
