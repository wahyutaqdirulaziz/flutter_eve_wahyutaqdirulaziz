import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/controllers/auth_controllers.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/sign_up_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/widget/custome_text_field.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/colors_style.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/text_style.dart';
import 'package:get/get.dart';

class SignPageScreen extends StatelessWidget {
  final bloc = Get.put(AuthController());
  SignPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => bloc.mainloading.isTrue ? const Center(child: CircularProgressIndicator(),) :SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 200,
                    ),
                    Text(
                      "Sign In to Eve Application",
                      style: greyTextStyle.copyWith(fontSize: 14),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 18, right: 18),
                child: Form(
                  key: bloc.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: bloc.emailCo.value,
                        label: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => CustomTextField(
                          controller: bloc.passwordCo.value,
                          label: 'Password',
                          isPassword: true,
                          isObscured: bloc.obscured.value,
                          onTapSuffixIcon: () {
                            bloc.toggleObscured();
                          },
                          suffixIcon: bloc.obscured.isTrue
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          /** Checkbox Widget **/
                          Obx(
                            () => Checkbox(
                              value: bloc.rememberme.value,
                              onChanged: (value) {
                                bloc.rememberMe();
                              },
                            ), //Checkbox
                          ),
                          Text(
                            'Remember me',
                            style: blackTextStyle,
                          ), //Text
                        ], //<Widget>[]
                      ), //R
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                              style: ButtonStyle(
                                  // padding: MaterialStateProperty.all<EdgeInsets>(
                                  //     const EdgeInsets.symmetric(
                                  //         vertical: 15, horizontal: 40)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          blueColor2),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          whiteColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side:
                                              BorderSide(color: blueColor2)))),
                              onPressed: () {
                                if (bloc.formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar.
                                  bloc.login();
                                }
                              },
                              child: Text("Sign In",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 14, fontWeight: bold))),
                        ),
                      ),
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        "Error",
                        "Comming soon in integration !",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: Material(
                      elevation: 2.0, // you can adjust this value as needed
                      shape:
                          const CircleBorder(), // to ensure the elevation is also in circle shape
                      clipBehavior: Clip
                          .antiAlias, // this will clip the shadow to be in circle shape
                      child: ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.white,
                          child: Image.asset(
                            "assets/fb.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      bloc.signInWithGoogle();
                    },
                    child: Material(
                      elevation: 2.0, // you can adjust this value as needed
                      shape:
                          const CircleBorder(), // to ensure the elevation is also in circle shape
                      clipBehavior: Clip
                          .antiAlias, // this will clip the shadow to be in circle shape
                      child: ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.white,
                          child: Image.asset(
                            "assets/google.png",
                          ),
                        ),
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
                    child: Material(
                      elevation: 2.0, // you can adjust this value as needed
                      shape:
                          const CircleBorder(), // to ensure the elevation is also in circle shape
                      clipBehavior: Clip
                          .antiAlias, // this will clip the shadow to be in circle shape
                      child: ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.white,
                          child: Image.asset(
                            "assets/ios.png",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
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
      ),) 
    );
  }
}
