import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mooapp/service/authMalSahibi.dart';

void main() {
  runApp(MaterialApp(home: forgotPassword()));
}

class forgotPassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}
final FirebaseAuth _auth = FirebaseAuth.instance;


class _forgotPasswordState extends State<forgotPassword> {

  AuthService _forgotPassword = AuthService();

TextEditingController forgotPassword =TextEditingController();


  Widget toastMessage(BuildContext context){
    Fluttertoast.showToast(
        msg: "Şifre Yenileme Maili Gönderildi!",
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 14);

    Navigator.pop(context);
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(
            onPressed:() {Navigator.pop(context);},

              color: Colors.black
          ),
          title: Text("Şifremi Unuttum",
              style: TextStyle( color: Colors.black)),
          centerTitle: true,
        ),
        body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // height: 100.0,
                ),
                Container(
                  width: width,
                  height: height * 0.50,
                  child: Image.asset(
                    'assets/images/sifre2.jpg',
                    // fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '   ',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                Text(
                  'Unuttuğunuz Şifrenin Mail Adresini Giriniz ...',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 10),

                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: forgotPassword,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),

                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: RaisedButton(
                          child: Text('      Şifreyi Yenile      '),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          color: Color(0xffb6d2bc),
                          onPressed: () {


                            _forgotPassword
                                .sendPassword(forgotPassword.text);
                            Timer(
                                Duration(seconds: 2),
                                    () => toastMessage(context));

                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 1.0),
                GestureDetector(
                  child: Text.rich(
                    TextSpan(
                        text: 'E-postanı kontrol etmeyi unutma!',
                        children: [
                          //TextSpan(
                          // text: 'Signup',
                          //style: TextStyle(color: Color(0xffEE7B23)),
                          //),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
