import 'package:flutter/material.dart';
import 'package:mooapp/main.dart';
import 'package:mooapp/malsahibi/api/malsahibi_phoneapi.dart';
import 'package:mooapp/malsahibi/malsahibi_profileedit.dart';
import 'package:mooapp/malsahibi/malsahibi_task.dart';
import 'package:mooapp/secondlogin.dart';

import 'package:mooapp/tacir/tacir_profileedit.dart';

class tacirBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            color: Colors.white),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  IconButton(
                      icon: Icon(Icons.article_sharp),
                      color: Color(0xFF676E79),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Hakkinda());
                      }),
                ],
              )),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width / 2 - 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                IconButton(
                    icon: Icon(Icons.logout),
                    color: Color(0xFF676E79),
                    onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>CikisYap ());
                    }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class Hakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 480,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'HAKKINDA',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' Bu Proje Teknofest Yarışması İçin \n Selçuk Üniversitesi Bilgisayar Mühendisi \n Öğrencileri Tarafından Yapılmıştır .',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '              Elif GENÇ \n elifgenc728@gmail.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '           Donüşay GÜNEŞ \n donusaygunes@gmail.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '               Onurhan KAYA \n onurhankaya1999@gmail.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '            Ali ÖZTEN \n aliozten92@gmail.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.brown,
                      child: Text(
                        'Geri',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -60,
              child: CircleAvatar(
                backgroundColor: Colors.brown,
                radius: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
          ],
        ));
  }
}

class CikisYap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'Çıkış Yap',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Çıkış Yapmak İstediğinize Emin Misiniz ?',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => mainPage()));
                      },
                      color: Color(0xff7b0922),
                      child: Text(
                        'Çıkış Yap',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Color(0xff325236),
                      child: Text(
                        'Vazgeç',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -60,
              child: CircleAvatar(
                backgroundColor: Colors.brown,
                radius: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
          ],
        ));
  }
}
