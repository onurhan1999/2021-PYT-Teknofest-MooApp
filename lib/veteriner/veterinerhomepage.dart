import 'dart:convert';
import 'package:mooapp/main.dart';
import 'package:mooapp/model/veterinerimage_model.dart';
import 'package:mooapp/veteriner/loginPage.dart';
import 'package:mooapp/veteriner/veterinerdetailepage.dart';
import 'package:mooapp/src/widget/veterinerappbar_widget.dart';
import 'package:mooapp/src/widget/veterinercolor_helper.dart';
import 'package:mooapp/src/widget/veterinertext_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home :Scaffold(
      backgroundColor: indigoColor,
      appBar: appBar(
        elevation: 0,
        backgroundColor: whiteColor,


        /*leading:  Icon(   // En soldaki üç çizgi ikonu kullanır mıyız bilemedim.Onun yerine geri butonu daha iyi olur
          Icons.arrow_back_rounded,
          color: blackColor,
          size: 32
        ),*/

        actions: [
          InkWell(
            //onTap: (){ //YENİ EKLENDİ TIKLAMA

            //},
            child: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              color: blackColor,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => vetLogin()));
              },
              alignment: Alignment.centerLeft,
              //size: 32
            ),

            /*child: IconButton(
        icon: Icon(Icons.bluetooth),
        color:blackColor,
        onPressed: () {

        },*/
          ),
          SizedBox(width: 275,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: (context.screenWidth * 0.03),
            ),
            child: InkWell(
              onTap: () {}, //YENİ EKLENDİ TIKLAMA
              child: CircleAvatar(
                radius: 23,
                backgroundColor: blackColor,
                backgroundImage: AssetImage("assets/images/vet.jpg"),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: context.screenHeight *
                0.8, //en alt morun kenarını yuvarlama oranı
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.02,
                  vertical: context.screenHeight * 0.02),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start, //YAZIYI ORTALIYOR KALDIRINCA
                children: [
                  text(
                    'Veteriner Hekim Baran Şahin ',
                    textColor: indigoColor,
                    size: context.textTheme.headline6.fontSize,
                  ),
                  5.heightBox,
                  text(
                    'Hoş Geldiniz',
                    fontWeight: FontWeight.bold,
                    size: context.textTheme.headline4.fontSize,
                    textColor: indigoColor,
                  ),
                  20.heightBox,
                  buildProgressStatus(context),
                  30.heightBox,
                  buildRowText(context,
                      title: "Hasta Hayvanlar", titletwo: " "),
                  20.heightBox,
                  buildlistcourse(context),
                ],
              ),
            ),
          ),
        ],
      ),

    ),);
  }

  Widget buildProgressStatus(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.010,
      /*child: Slider(    //ORTADAKİ ÇİZGİ
        activeColor: amberColor,
        value: _val,
        onChanged: (value) {
          setState(() {
            _val = value;
          });
        },
      ),*/
    );
  }

  Widget buildRowText(BuildContext context, {String title, String titletwo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        text(
          title,
          fontWeight: FontWeight.bold,
          size: context.textTheme.headline6.fontSize,
        ),
        text(
          titletwo,
          textColor: indigoColor,
          fontWeight: FontWeight.bold,
          size: context.textTheme.headline6.fontSize,
        ),
      ],
    );
  }

  Widget buildlistcourse(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.4,
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/images/user.json'),
        builder: (_, snapshot) {
          var data = json.decode(snapshot.data.toString());
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        img: img[index],
                        id: data[index]['id'],
                        title: data[index]['title'],
                        subtitle: data[index]['subtittle'],
                        recentwatchtime: data[index]['recentwatchtime'],
                        availableClasstitleone: data[index]['availableClassone']
                        ['title'],
                        availablewatchtimeone: data[index]['availableClassone']
                        ['availablewatchtime'],
                        availableClasstitletwo: data[index]['availableClasstwo']
                        ['title'],
                        availablewatchtimetwo: data[index]['availableClasstwo']
                        ['availablewatchtime'],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  leading: img[index],

                  title: text("${data[index]['title']}",
                      fontWeight: FontWeight.bold),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      8.heightBox,
                      text("${data[index]['subtittle']}",
                          textColor: blackColor),
                      2.heightBox,
                      text("${data[index]['recentwatchtime']}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
