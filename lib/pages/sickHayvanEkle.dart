import 'package:mooapp/pages/sickStatusList.dart';
import 'package:mooapp/service/authVeteriner.dart';
import 'package:mooapp/pages/status_list.dart';
import 'package:mooapp/pages/add_status.dart';
import 'package:flutter/material.dart';

class sickHayvanEkle extends StatefulWidget {
  @override
  _sickHayvanEkleState createState() => _sickHayvanEkleState();
}

class _sickHayvanEkleState extends State<sickHayvanEkle> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*  appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('HASTA HAYVANLAR',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 20.0,
                    color: Color(0xFF545D68))),
          ),*/

          //////////////DEĞİŞTİR
          body: sickStatusList()),
      //////////////DEĞİŞTİR  STATUS LİST YAP



    );
  }
}