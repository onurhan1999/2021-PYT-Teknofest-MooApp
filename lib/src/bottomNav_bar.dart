import 'package:flutter/material.dart';
import 'package:mooapp/veteriner/veterinerhomepage.dart';
import 'package:mooapp/src/Widget/veterinercolor_helper.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> _children = [
    HomePage(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          type: BottomNavigationBarType.shifting,
          selectedLabelStyle: TextStyle(color: orangeColor),
          selectedItemColor: whiteColor,
          unselectedItemColor: greyColor,
          currentIndex: _currentIndex,
          //if you tap the bottom navbar then you can uncomment this line
          // onTap: (index) {
          //   _currentIndex = index;
          //   setState(() {});
          // },
          items: [
            BottomNavigationBarItem(
              backgroundColor: indigoColor,
              label: "Ana Sayfa",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              backgroundColor: indigoColor,
              label: "Record",
              icon: Icon(Icons.book_online_rounded),
            ),
           BottomNavigationBarItem(
              backgroundColor: indigoColor,
              label: "Searching",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              backgroundColor: indigoColor,
              label: "Notification",
              icon: Icon(Icons.notifications_none),
            ),
          ],
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}
