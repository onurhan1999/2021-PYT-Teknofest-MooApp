import 'package:mooapp/pages/milkStatusList.dart';
import 'package:mooapp/service/authVeteriner.dart';
import 'package:mooapp/pages/status_list.dart';
import 'package:mooapp/pages/add_status.dart';
import 'package:flutter/material.dart';

class milkHayvanEkle extends StatefulWidget {
  @override
  _milkHayvanEkleState createState() => _milkHayvanEkleState();
}

class _milkHayvanEkleState extends State<milkHayvanEkle> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(





          //////////////DEĞİŞTİR
          body: milkStatusList()),
      //////////////DEĞİŞTİR  STATUS LİST YAP



    );
  }
}