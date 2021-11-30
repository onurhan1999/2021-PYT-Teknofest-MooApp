import 'package:flutter/material.dart';
import 'package:mooapp/tacir/tacirbottom_bar.dart';
import 'package:mooapp/src/Widget/veterinertext_widget.dart';
import 'package:mooapp/src/Widget/veterinercolor_helper.dart';
import 'package:velocity_x/velocity_x.dart';

// 2.SAYFA --- > Hayvan Detay (APPBAR DA YAZIYOR)

class CookieDetail extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  CookieDetail({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Hayvan Detay',
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
      body: ListView(children: [
        SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Cookie',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff325236),
              )),
        ),
        SizedBox(height: 15.0),
        Hero(
            tag: assetPath,
            child: Image.asset(assetPath,
                height: 150.0, width: 100.0, fit: BoxFit.contain)),
        SizedBox(height: 20.0),
        Center(
          child: Text(cookieprice,
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff325236),
              )),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(cookiename,
              style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                'Delicious deluxe cow. Pick your favorite deluxe flavor.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))),
          ),
        ),
        SizedBox(height: 20.0),
        buildlistAvailableClass(
          context,
          id: "", //icon dene.. madde sıralaması
          textTitle: "Hayvan Sahibi : Veli Korkmaz,     "
              "    Telefon: 0555 555 55 55 ",
          textsubtitle: " ", //SİLİNCE KIRMIZI EKRAN ALTTAKİ KÜÇÜK YAZI
        ),
        buildlistAvailableClass(
          context,
          id: "",
          textTitle: "Şikayet: Sarı Kız doğum yapmak üzere..",
          textsubtitle: " ",
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 250.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color(0xff0e8b1e),
            ),
            child: Center(
                child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.call, size: 20),
                  ),
                  TextSpan(
                    text: "  Sahibini Ara",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
          ),
        ),
        SizedBox(height: 35.0),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xff325236),
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: tacirBottom(),
    );
  }
}

Widget buildlistAvailableClass(BuildContext context,
    {String id, String textTitle, String textsubtitle}) {
  return ListTile(
    leading: text(id,
        size: context.textTheme.headline5.fontSize, textColor: greyColor),
    title: text(
      textTitle,
      fontWeight: FontWeight.bold,
      size: 18,
    ),
    subtitle: text(
      textsubtitle,
      fontWeight: FontWeight.bold,
      textColor: greyColor, //ikinci sayfadaki alttaki küçük yazı
    ),
  );
}
