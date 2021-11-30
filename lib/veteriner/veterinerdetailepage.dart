import 'package:flutter/material.dart';
import 'package:mooapp/src/Widget/veterinercolor_helper.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:mooapp/src/Widget/veterinertext_widget.dart';

class DetailPage extends StatefulWidget {
  final String id;
  final String title;
  final String recentwatchtime;
  final String subtitle;
  final Image img;
  final String availableClasstitleone;
  final String availablewatchtimeone;
  final String availableClasstitletwo;
  final String availablewatchtimetwo;
  const DetailPage({
    Key key,
    this.img,
    this.id,
    this.title,
    this.recentwatchtime,
    this.subtitle,
    this.availableClasstitleone,
    this.availablewatchtimeone,
    this.availableClasstitletwo,
    this.availablewatchtimetwo,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(height: context.screenHeight * 0.4, child: widget.img),
              2.heightBox,
              text(
                " ", //FOTOĞRAFIN HEMEN ALTINDAKİ YAZI
                textColor: Colors.indigo, //ikinci sayfa ilk kelime
                size: context.textTheme.headline6.fontSize,
                fontWeight: FontWeight.bold,
              ),
              7.heightBox,
              text(
                " #01092021 SARI KIZ   ",
                size: context.textTheme.headline5.fontSize,
                fontWeight: FontWeight.bold,
              ),
              7.heightBox, //ALTTAKİ GÖRÜNMEZ YAZI
              text(
                " ",
                size: context.textTheme.bodyText1.fontSize,
                textColor: greyColor,
                fontWeight: FontWeight.bold,
              ),
              1.heightBox,
              buildTextwithIcon(context,
                  labelText: "Hayvanın konumuna git    "),
              20.heightBox,
              text("Hayvan sahibi mesaj:",
                  size: context.textTheme.headline6.fontSize,
                  fontWeight: FontWeight.bold),
              7.heightBox,
              buildlistAvailableClass(
                context,
                id: "", //icon dene.. madde sıralaması
                textTitle: "Hayvan Sahibi : Veli Korkmaz,     "
                    "    Telefon: 0555 555 55 55 ",
                textsubtitle: " " , //SİLİNCE KIRMIZI EKRAN ALTTAKİ KÜÇÜK YAZI
              ),
              buildlistAvailableClass(
                context,
                id: "",
                textTitle: "Şikayet: Sarı Kız doğum yapmak üzere..",
                textsubtitle: " ",
              ),
            ],
          ),
        ),
      ),
    );
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

  Widget buildTextwithIcon(BuildContext context,
      {String labelText, IconData iconData}) {
    return Row(
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10.0,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: indigoColor, //hayvan id renk
                minimumSize: Size(
                    context.screenWidth * 0.2, context.screenHeight * 0.07),
              ),
              icon: Icon(iconData),
              label: text(
                labelText,
                fontWeight: FontWeight.bold,
                size: context.textTheme.headline6.fontSize,
              ),
            ),
          ),
        ),
        10.widthBox,
        /*Card(                            //FAV ICON KALKTI
          elevation: 10,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(
                    context.screenWidth * 0.02, context.screenHeight * 0.07),
              ),
              onPressed: () {},
              child: Icon(Icons.favorite_border)),
        ),*/
      ],
    );
  }
}
