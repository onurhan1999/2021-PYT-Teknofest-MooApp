import 'package:mooapp/malSahibi/malsahibi_appBars.dart';
import 'package:mooapp/pages/saleStatusList.dart';
import 'package:mooapp/service/authVeteriner.dart';
import 'package:mooapp/pages/status_list.dart';
import 'package:mooapp/pages/add_status.dart';
import 'package:flutter/material.dart';

class saleHayvanEkle extends StatefulWidget {
  @override
  _saleHayvanEkleState createState() => _saleHayvanEkleState();
}

class _saleHayvanEkleState extends State<saleHayvanEkle> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(



          //////////////DEĞİŞTİR
          body: saleStatusList()),
      //////////////DEĞİŞTİR  STATUS LİST YAP



    );
  }
}