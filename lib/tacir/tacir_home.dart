import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mooapp/tacir/tacir_page.dart';
import 'package:mooapp/tacir/tacirbottom_bar.dart';
import 'package:mooapp/service/authTacir.dart';

// 1.SAYFA --- > TACİR ARAYÜZÜ (APPBAR DA YAZIYOR)
class TacirHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tacirHomePage(),
    );
  }
}

class tacirHomePage extends StatefulWidget {
  @override
  _tacirHomePageState createState() => _tacirHomePageState();
}

class _tacirHomePageState extends State<tacirHomePage>
    with SingleTickerProviderStateMixin {
  AuthService _authService = AuthService();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
            onPressed: () {
              Navigator.pop(context);
              _authService.tacirSignOut();

            },
          ),
          title: Text('Tacir Arayüzü',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  color: Color(0xFF545D68))),
          actions: <Widget>[
            /*  IconButton(
             icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
              onPressed: () {},
            ),*/
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 20.0),
          children: <Widget>[
            SizedBox(height: 5.0),
            Text('Hayvanlar',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 0.0),
            TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: Color(0xff325236),
                isScrollable: true,
                labelPadding: EdgeInsets.only(right: 45.0),
                unselectedLabelColor: Color(0xFFCDCDCD),
                tabs: [
                  Tab(
                    child: Text('Kesimlik Hayvanlar',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  ),
                  Tab(
                    child: Text(' ',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  ),
                  Tab(
                    child: Text(' ',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 21.0,
                        )),
                  )
                ]),
            Container(
                height: MediaQuery.of(context).size.height - 50.0,
                width: double.infinity,
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      CookiePage(),
                      CookiePage(),
                      CookiePage(),
                    ]
                )
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {},
          backgroundColor: Color(0xff325236),
          child: Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: tacirBottom(),
      ),
    );
  }
}
