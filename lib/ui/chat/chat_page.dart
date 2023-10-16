import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/colors_style.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/text_style.dart';

class ChatPageScreen extends StatelessWidget {
  const ChatPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Center(
        child: Text(
          "Coming soon",
          style: greyTextStyle.copyWith(fontWeight: bold),
        ),
      ),
    );
  }
}
