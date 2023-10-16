import 'package:flutter/material.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/Profile/profile_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/chat/chat_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/ui/home/home_page.dart';
import 'package:flutter_eve_wahyu_taqdirul_aziz/utilities/colors_style.dart';

/// Flutter code sample for [BottomNavigationBar].

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const ChatPageScreen(),
    ProfilePageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.chat),
            ),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: blueColor2,

        onTap: _onItemTapped,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
      ),
    );
  }
}
