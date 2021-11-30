import 'package:mooapp/malSahibi/malsahibi_appBars.dart';
import 'package:mooapp/malSahibi/malsahibi_bottom_bar.dart';
import 'package:mooapp/service/authMalSahibi.dart';
import 'package:mooapp/service/status_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mooapp/pages/add_status.dart';
import 'package:mooapp/tacir/tacirbottom_bar.dart';

class salePageStatusList extends StatefulWidget {
  @override
  _salePageStatusListState createState() => _salePageStatusListState();
}
String mailDenemeler='';


class _salePageStatusListState extends State<salePageStatusList> {
  StatusService _statusService = StatusService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home : Scaffold(
        appBar: salePageAppBar(context),

        body: StreamBuilder<QuerySnapshot>(
          stream: _statusService.getSalesmanStatus(),
          builder: (context, snaphot) {
            return !snaphot.hasData
                ? CircularProgressIndicator()
                : ListView.builder(
                itemCount: snaphot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot mypost = snaphot.data.docs[index];

                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(

                        child: Container(
                          height: size.height * .23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.blue, width: 2),
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
                                                fontSize: 16,
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
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "Satılık Durumu:  ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              " Hastalık Durumu:  ",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "Süt Durumu:  ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "Tel No:  ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "${mypost['Küpe No']}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "${mypost['Fiyat Bilgisi']}",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                              "${mypost['Cinsiyeti']}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "${mypost['Satılık Durumu']}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "${mypost['Hastalık Durumu']}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "${mypost['Süt Durumu']}",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "${mypost['Sahip Tel No']}",
                                              style: TextStyle(fontSize: 16),
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
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => salePageStatusList()));
        },
          backgroundColor: Color(0xff325236),
          child: Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: tacirBottom(),
      ),
    );
  }
}
