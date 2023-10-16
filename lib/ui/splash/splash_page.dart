import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/splash/controllers/splash_controllers.dart';

import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  final bloc = Get.put(SplashControllers());
  SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              "assets/logo.png",
              width: 170,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
        ],
      ),
    );
  }
}
