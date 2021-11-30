import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mooapp/malSahibi/malsahibi_task.dart';
import 'package:mooapp/pages/hayvanekle.dart';
import 'package:mooapp/veteriner/loginPage.dart';

String setGetMail='';
String setGetTel='';



authMalSahibiGetter(String getMail){

  getMail=setGetMail;
  print("getter içinden sonra mail");
  print(getMail);
  print("getter içinden sonra mail");
return getMail;
}

authMalSahibiSetter(String mail){
  setGetMail=mail;
  print("setter içinden sonra mail");
  print(setGetMail);
  print("setter içinden sonra mail");

}

authMalSahibiGetterTel(String getTel){

  getTel=setGetTel;
  print("getter içinden sonra tel");
  print(getTel);
  print("getter içinden sonra tel");
  return getTel;
}
authMalSahibiSetterTel(String tel){
  setGetTel=tel;
  print("setter içinden sonra tel");
  print(setGetTel);
  print("setter içinden sonra tel");

}




final FirebaseAuth _auth1 = FirebaseAuth.instance;



Widget toastMessage(BuildContext context){
  Fluttertoast.showToast(
      msg: "Girilen Mail Adresi Bulunamadı!",
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 14);


}
class AuthService extends vetLogin{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  checkMalSahibiSign(String email,String password,BuildContext context){
    print("check malsahibi");
    var vetRef=FirebaseFirestore.instance.collection("Mal Sahibi").doc(email);
    vetRef.get().then((doc) => {
      print("if üstü"),
      if(doc.exists){
        print("if içi"),
        signMalSahibiIn(email, password,context),
      }
      else{
        toastMessage(context)
      }

    });
  }
  Future<User> sendPassword(String email)  {
    print(email);

    _auth.sendPasswordResetEmail(email: email);


  }
  ///////////////////////////////////////////////

  ///////////////////////////////////////////////


  //giriş yap fonksiyonu
  Future<User> signMalSahibiIn(String email, String password,BuildContext context) async {
    print(email);
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    _auth.sendPasswordResetEmail(email: email);



    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MalsahibiAnasayfa()));
    return user.user;
  }

  //çıkış yap fonksiyonu
  signMalSahibiOut() async {
    return await _auth.signOut();
  }

  // veteriner kayıt ol fonksiyonu
  Future<User> createMalSahibi(String name, String email, String password,String tel) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("Mal Sahibi")
        .doc(email)
        .set({'Kullanıcı Adı': name, 'E-Mail': email,'Telefon No':tel});

    return user.user;
  }
}