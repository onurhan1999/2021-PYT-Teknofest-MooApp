import 'package:flutter/material.dart';
import 'package:mooapp/malsahibi/malsaihibi_util.dart';
import 'package:mooapp/pages/milkHayvanEkle.dart';
import 'package:mooapp/malsahibi/malsahibi_appBars.dart';

import 'package:mooapp/pages/add_status.dart';
import 'package:mooapp/pages/hayvanekle.dart';
import 'package:mooapp/pages/saleHayvanEkle.dart';
import 'package:mooapp/pages/sickHayvanEkle.dart';
import 'malsahibi_bottom_bar.dart';
import 'package:mooapp/pages/status_list.dart';

class MalsahibiAnasayfa extends StatefulWidget {
  MalsahibiAnasayfa({Key key}) : super(key: key);
  _MalsahibiAnasayfa createState() => _MalsahibiAnasayfa();
}
class _MalsahibiAnasayfa extends State<MalsahibiAnasayfa> {




  final bottomNavigationBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: fullAppbar(context),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => Container(
                          margin: EdgeInsets.only(left: 10, top: 0, bottom: 0),
                          child: Text(
                            '',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                color: CustomColors.TextSubHeader),
                          ),
                        ),
                    childCount: 1),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => hayvanEkle()));
                    },
                    child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 120,
                                child:
                                    Image.asset('assets/images/tumhayvanlar.png'),
                                decoration: const BoxDecoration(
                                  color: CustomColors.YellowBackground,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Tüm Hayvanlar',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: CustomColors.TextHeaderGrey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.GreyBorder,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(10),
                        height: 150.0),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => milkHayvanEkle()));
                    },
                    child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 120,
                                child:
                                    Image.asset('assets/images/sutverenler.png'),
                                decoration: const BoxDecoration(
                                  color: CustomColors.GreenBackground,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Süt Alınan Hayvanlar',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: CustomColors.TextHeaderGrey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.GreyBorder,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(10),
                        height: 150.0),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => sickHayvanEkle()));
                    },
                    child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 120,
                                child: Image.asset('assets/images/hastainek.png'),
                                decoration: const BoxDecoration(
                                  color: CustomColors.PurpleBackground,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Hasta Hayvanlar',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: CustomColors.TextHeaderGrey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.GreyBorder,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(10),
                        height: 150.0),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => saleHayvanEkle()));
                    },
                    child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 140,
                                height: 120,
                                child: Image.asset('assets/images/satilik.png'),
                                decoration: const BoxDecoration(
                                  color: CustomColors.OrangeBackground,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Satılık Hayvanlar',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: CustomColors.TextHeaderGrey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.GreyBorder,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ],
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(10),
                        height: 150.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddStatusPage()));
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
