import 'package:mooapp/malSahibi/malsahibi_appBars.dart';
import 'package:mooapp/malSahibi/malsahibi_bottom_bar.dart';
import 'package:mooapp/service/authMalSahibi.dart';
import 'package:mooapp/service/status_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mooapp/pages/add_status.dart';

class StatusListPage extends StatefulWidget {
  @override
  _StatusListPageState createState() => _StatusListPageState();
}
String mailDenemeler='';


class _StatusListPageState extends State<StatusListPage> {
  StatusService _statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: allAppBar(context),

        body: StreamBuilder<QuerySnapshot>(
          stream: _statusService.getMailStatus(authMalSahibiGetter(mailDenemeler)),
          builder: (context, snaphot) {
            return !snaphot.hasData
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: snaphot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mypost = snaphot.data.docs[index];




                      Future<void> _showChoiseDialog(BuildContext context) {
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return MaterialApp(
                                home: AlertDialog(
                                    title: Text(
                                      "Silmek istediğinize emin misiniz?",
                                      textAlign: TextAlign.center,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(8.0))),
                                    content: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {

                                                _statusService
                                                    .removeStatus(mypost.id);
                                                _statusService
                                                    .removeSickStatus(mypost.id);
                                                _statusService
                                                    .removeSaleStatus(mypost.id);
                                                _statusService
                                                    .removeMilkStatus(mypost.id);
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Evet",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {

                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Vazgeç",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ))),
                              );
                            });
                      }

                      return Container(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              _showChoiseDialog(context);
                            },
                            child: Container(

                              height: size.height * .21,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.blue, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage:
                                                  NetworkImage(mypost['image']),
                                              radius: size.height * 0.055,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  " Küpe No:  ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  " Fiyat Bilgisi (TL):  ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  "Cinsiyeti:  ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  "Satılık Durumu:  ",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  " Hastalık Durumu:  ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  "Süt Durumu:  ",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  "Tel No:  ",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "${mypost['Küpe No']}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  "${mypost['Fiyat Bilgisi']}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  "${mypost['Cinsiyeti']}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  "${mypost['Satılık Durumu']}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  "${mypost['Hastalık Durumu']}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  "${mypost['Süt Durumu']}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  "${mypost['Sahip Tel No']}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
          },
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
