import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:mooapp/malSahibi/malsahibi_bottom_bar.dart';
import 'package:mooapp/malsahibi/malsahibi_task.dart';
import 'package:mooapp/malsahibi/malsaihibi_util.dart';
import 'package:mooapp/pages/add_status.dart';

//import 'dart:async';
//import 'package:easy_theme/easy_theme.dart';



class MalsahibiPcall extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MalsahibiPcall> {
  TextEditingController _numberCtrl = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "05074958100";
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home :  Scaffold(
        body: Column(
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(300.0),
             child: GradientAppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MalsahibiAnasayfa()));
                },
              ),
            //  toolbarHeight: 162,
             // backgroundColor:Color(0xff02450a),
              iconTheme: IconThemeData(color: Colors.black),
              automaticallyImplyLeading: true,
              title: Text(
                'Veterinerinizi Arayınız',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lora',
                  color: Color(0xFFFDFBFB),
                  fontStyle: FontStyle.italic,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 1,
    gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [CustomColors.GreenDark, CustomColors.GreenLight,CustomColors.BellGrey],),
             ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _numberCtrl,
                    decoration: InputDecoration(labelText: "Kayıtlı Veterineriniz ..."),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white30,shadowColor: Colors.green),
                  child: Text(
                    "Veterineri Ara",
                    style: TextStyle(
                      fontFamily: 'Lora',
                      color: Color(0xFF016601),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressed: () async {
                    FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                  },
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddStatusPage()));
          },
          backgroundColor: Color(0xff325236),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBarApp(),
      ),
    );
  }
}
