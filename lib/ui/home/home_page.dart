import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/controllers/auth_controllers.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/colors_style.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/text_style.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final bloc = Get.put(AuthController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: whiteColor),
        backgroundColor: blueColor2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              color: blueColor2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 40),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 17, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              bloc.firebaseUser.value?.displayName ??
                                  "Hi, My Name",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 28, fontWeight: semibold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Welcome to Eve Application",
                              style: whiteTextStyle.copyWith(fontSize: 14))
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Image.asset(
                        "assets/img_home.png",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "Eve Mobile",
              style:
                  blackTextStyle.copyWith(fontSize: 22, fontWeight: semibold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: Text(
                "Eve Mobile adalah aplikasi mobile cerdas yang dirancang khusus untuk memenuhi kebutuhan digital generasi saat ini. Menyajikan kombinasi antara desain intuitif dan teknologi terdepan, Eve Mobile menjanjikan pengalaman yang tak tertandingi di dunia mobile.Dengan berbagai fitur inovatif yang disesuaikan untuk memudahkan aktivitas sehari-hari, Eve Mobile menjadi teman setia yang selalu ada di saku Anda. Mulai dari konektivitas, produktivitas, hingga hiburan, semuanya terintegrasi dengan sempurna dalam satu aplikasi Eve Mobile tidak hanya aplikasi, tetapi juga representasi dari masa depan teknologi mobile. Keamanan dan privasi data pengguna menjadi prioritas kami, memberikan Anda ketenangan saat menggunakan aplikasi. Dikembangkan oleh tim ahli dengan dedikasi tinggi, Eve Mobile siap menemani setiap momen Anda.Dapatkan Eve Mobile sekarang dan rasakan evolusi teknologi mobile di ujung jari Anda!",
                style: greyTextStyle.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
