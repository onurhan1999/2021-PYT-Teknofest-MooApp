import 'package:mooapp/service/authVeteriner.dart';
import 'package:mooapp/pages/status_list.dart';
import 'package:mooapp/pages/add_status.dart';
import 'package:flutter/material.dart';

class hayvanEkle extends StatefulWidget {
  @override
  _hayvanEkleState createState() => _hayvanEkleState();
}

class _hayvanEkleState extends State<hayvanEkle> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: Scaffold(





          //////////////DEĞİŞTİR
          body: StatusListPage()),
      //////////////DEĞİŞTİR  STATUS LİST YAP



    );
  }
}