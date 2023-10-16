

import 'package:flutter_eve_wahyu_taqdirul_aziz/shared/firebase_auth.dart';

import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/controllers/auth_controllers.dart';

import 'package:get/get.dart';

class SplashControllers extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    startTimer();
  }

  startTimer() async {
    await firebaseInitialization.then((value) {
      Get.put(AuthController());
    });
  }
}
