import 'package:flutter/material.dart';
import 'package:mooapp/forgotPassword.dart';
import 'package:mooapp/main.dart';
import 'package:mooapp/malSahibi/signup.dart';
import 'package:mooapp/pages/add_status.dart';
import 'package:mooapp/secondlogin.dart';
import 'package:mooapp/service/authMalSahibi.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mooapp/src/Widget/bezierContainer.dart';

class loginMalSahibi extends StatefulWidget {
  loginMalSahibi({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _loginMalSahibiState createState() => _loginMalSahibiState();
}

class _loginMalSahibiState extends State<loginMalSahibi> {
  AuthService _MSauthService = AuthService();
  final TextEditingController _MSemailController = TextEditingController();
  final TextEditingController _MSpasswordController = TextEditingController();


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
                    color: Colors.blueGrey,
                    offset: Offset(2, 4),
                    blurRadius: 2,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffb1b1b1), Color(0xce325236)])),
          child: Text(
            'Giriş Yap',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onTap: () {
          authMalSahibiSetter(_MSemailController.text);

          _MSauthService
              .checkMalSahibiSign(_MSemailController.text, _MSpasswordController.text,context);

        });
  }
/*  veterinerhomepageye giden kod





 */
  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('veya'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }



  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => signUpMalSahibi()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hesabınız yok mu?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              child: Text(
                'Kayıt Ol',
                style: TextStyle(
                    color: Color(0xff02450a),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => signUpMalSahibi()));
              },
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
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Email",
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
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Şifre",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: _MSpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff3f3f4),
                      filled: true))
            ],
          ),
        )
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
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
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
                      SizedBox(height: 50),
                      _emailPasswordWidget(),
                      SizedBox(height: 20),
                      _submitButton(),
                      SizedBox(height: 15),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => forgotPassword()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: Text('Şifremi Unuttum ?',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      _divider(),
                      _createAccountLabel(),
                    ],
                  ),
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        )));
  }
}
