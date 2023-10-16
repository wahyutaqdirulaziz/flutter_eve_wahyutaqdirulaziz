import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/shared/firebase_auth.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/auth/controllers/auth_controllers.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/splash/splash_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/colors_style.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 
  // await Supabase.initialize(
  //   url: 'https://cyiiieokxgjfhptuohjj.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImN5aWlpZW9reGdqZmhwdHVvaGpqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTczNDQ5NDAsImV4cCI6MjAxMjkyMDk0MH0.8UtICBC0l7cD3hUeYin3PnsBgm7l4I3Oy5yDjsJkwzA',
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eve Teknologi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blueColor2),
        useMaterial3: true,
      ),
      home: SplashScreenPage(),
    );
  }
}
