


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mooapp/pages/hayvanekle.dart';
import 'package:mooapp/veteriner/loginPage.dart';



class AuthService extends vetLogin{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  /*checkVetSign(String email,String password,BuildContext context){
    print("checkvetsign");
    var vetRef=FirebaseFirestore.instance.collection("Veteriner").doc(email);
    vetRef.get().then((doc) => {
      print("if üstü"),
      if(doc.exists){
        print("if içi"),
        signIn(email, password,context),
      }

    });
  }*/




  Future<User> createVet(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("Veteriner")
        .doc(email)
        .set({'userName': name, 'email': true});

    return user.user;
  }
}