import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mooapp/main.dart';
import 'package:mooapp/malSahibi/loginPage.dart';
import 'package:mooapp/secondlogin.dart';
import 'package:mooapp/src/Widget/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mooapp/service/authMalSahibi.dart';

class signUpMalSahibi extends StatefulWidget {
  signUpMalSahibi({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _signUpMalSahibiState createState() => _signUpMalSahibiState();
}

class _signUpMalSahibiState extends State<signUpMalSahibi> {
  final TextEditingController _MSnameController = TextEditingController();
  final TextEditingController _MSemailController = TextEditingController();
  final TextEditingController _MSpasswordController = TextEditingController();
  final TextEditingController _MStelController = TextEditingController();
  AuthService _MSauthService = AuthService();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DemoFlip3DApp()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Geri',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {

    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffb1b1b1), Color(0xff325236)])),
        child: Text(
          'Kayıt Ol',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      onTap: () {

        _MSauthService
            .createMalSahibi(_MSnameController.text, _MSemailController.text, _MSpasswordController.text,_MStelController.text)
            .whenComplete(() => Navigator.push(
            context, MaterialPageRoute(builder: (context) => loginMalSahibi())));
      },
    );
  }
  /*AlertDialog(
  title: Text('Sample Alert Dialog'),
  content: Text(
  'This is an implementation of the AlertDialog widget in Flutter',
  ),
  actions: [
  OutlineButton(
  onPressed: () => Navigator.of(context).pop(),
  child: Text('Close'),
  )
  ],
  )*/
  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => loginMalSahibi()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Zaten hesabınız var mı ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Giriş Yap',
              style: TextStyle(
                  color: Color(0xff325236),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
  Widget _logoyazi() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Mal',
          style: GoogleFonts.portLligatSans(

            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff),
          ),
          children: [
            TextSpan(
              text: ' Sahibi',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: ' Sayfasi',
              style: TextStyle(color: Color(0xffffffff), fontSize: 30),
            ),
          ]),
    );
  }
  Widget _title() {
    return Container(
      height: 120,
      child :Container(
        height: 200,
        width: 200,

        child: Image.asset(
          "assets/images/logo.png",
        ),
      ),                                    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Kullanıcı Adı',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: _MSnameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true),


            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: _MSemailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              'Şifre',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(

                obscureText: true,
                controller: _MSpasswordController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              'Tel No',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(15),
                ],
                controller: _MStelController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true))
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x68325236), Color(0xffffffff)])),
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      _title(),
                      _logoyazi(),
                      SizedBox(
                        height: 50,
                      ),
                      _emailPasswordWidget(),
                      SizedBox(
                        height: 20,
                      ),
                      _submitButton(),
                      _loginAccountLabel(),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        ),
      ),
    );
  }
}
