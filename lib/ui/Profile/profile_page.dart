import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/controllers/auth_controllers.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/colors_style.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/text_style.dart';
import 'package:get/get.dart';

class ProfilePageScreen extends StatelessWidget {
  final bloc = Get.put(AuthController());
  ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Obx(
          () => bloc.mainloading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: ClipOval(
                          child: Obx(
                            () => Image.network(
                              bloc.firebaseUser.value?.photoURL ??
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Windows_10_Default_Profile_Picture.svg/2048px-Windows_10_Default_Profile_Picture.svg.png",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    "assets/images/error_image.png"); // Provide a local error image path
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Obx(
                          () => Text(bloc.firebaseUser.value?.displayName ??
                              "My Name"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "12",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold),
                                  ),
                                  Text(
                                    "Fundrasing",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: light, fontSize: 12),
                                  ),
                                ],
                              ),
                              const VerticalDivider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "12",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold),
                                  ),
                                  Text(
                                    "Followers",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: light, fontSize: 12),
                                  ),
                                ],
                              ),
                              const VerticalDivider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "12",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold),
                                  ),
                                  Text(
                                    "Following",
                                    style: blackTextStyle.copyWith(
                                        fontWeight: light, fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: blueColor2, shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  Icons.account_balance_wallet,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rp.12.000.000",
                                  style:
                                      blackTextStyle.copyWith(fontWeight: bold),
                                ),
                                Text(
                                  "My Wallet Balance",
                                  style: greyTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                // Place your logic here for what should happen when the button is pressed
                                print("Button Pressed");
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: blueColor2,
                                side: BorderSide(
                                    color: blueColor2,
                                    width: 2), // Text and icon color
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25)), // Rounded corners
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 9), // Inner padding of the button
                              ),
                              child: Text(
                                "Top Up",
                                style:
                                    blueTextStyle.copyWith(color: blueColor2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("About",
                                style:
                                    blackTextStyle.copyWith(fontWeight: bold)),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: greyTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                              style: ButtonStyle(
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
                              onPressed: () async {
                                bloc.signOut();
                              },
                              child: Text("Logout",
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 14, fontWeight: bold))),
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }
}
