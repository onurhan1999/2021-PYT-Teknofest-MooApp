import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mooapp/tacir/salePageGoruntule.dart';
import 'package:mooapp/tacir/tacir_home.dart';





class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  checkTacSign(String email,String password,BuildContext context){
    print("checkvetsign");
    var vetRef=FirebaseFirestore.instance.collection("Tacir").doc(email);
    vetRef.get().then((doc) => {
      print("if üstü"),
      if(doc.exists){
        print("if içi"),
        tacirSignIn(email, password,context),
      }
      else{
      }
    });
  }


  //giriş yap fonksiyonu
  Future<User> tacirSignIn(String email, String password,BuildContext context) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => saleHayvanGoruntule()));

    return user.user;
  }

  //çıkış yap fonksiyonu
  tacirSignOut() async {
    return await _auth.signOut();
  }

  // veteriner kayıt ol fonksiyonu
  Future<User> createTacir(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("Tacir")
        .doc(email)
        .set({'userName': name, 'email': email});



    return user.user;
  }
}