import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mooapp/model/status.dart';
import 'package:mooapp/service/storage_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaUrl = '';

  //status eklemek için

  Widget toastMessage(BuildContext context){
    Fluttertoast.showToast(
        msg: "Kayıt Başarılı!",
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 14);

    Navigator.pop(context);
  }
  checkStatus(String status,String genderStat,String saleStat,String sickStat ,String milkStat,String mailAdresi,String priceStat,String telNo,XFile pickedFile,BuildContext context){

    var vetRef=FirebaseFirestore.instance.collection("Tüm Hayvanlar").doc(status);
    vetRef.get().then((doc) => {
      print("if üstü"),
      if(doc.exists){
        print("statü if içi"),

                 }
      else{
        addStatus(status,genderStat ,saleStat,sickStat,milkStat,mailAdresi,priceStat,telNo,pickedFile ?? '',context)
      }

    });
  }

  checkSaleStatus(String status,String genderStat,String saleStat,String sickStat ,String milkStat,String mailAdresi,String priceStat,String telNo,XFile pickedFile){
    var vetRef=FirebaseFirestore.instance.collection("Satılık Hayvanlar").doc(status);
    vetRef.get().then((doc) => {
      print("if üstü"),
      if(doc.exists){
        print("statü if içi"),

      }
      else{
        addSale(status,genderStat ,saleStat,sickStat,milkStat,mailAdresi,priceStat,telNo,pickedFile ?? '')
      }

    });
  }

  checkSickStatus(String status,String genderStat,String saleStat,String sickStat ,String milkStat,String mailAdresi,String priceStat,String telNo,XFile pickedFile){
    var vetRef=FirebaseFirestore.instance.collection("Hasta Hayvanlar").doc(status);
    vetRef.get().then((doc) => {
      print("if üstü"),
      if(doc.exists){
        print("statü if içi"),

      }
      else{
        addSick(status,genderStat ,saleStat,sickStat,milkStat,mailAdresi,priceStat,telNo,pickedFile ?? '')
      }

    });
  }
  checkMilkStatus(String status,String genderStat,String saleStat,String sickStat ,String milkStat,String mailAdresi,String priceStat,String telNo,XFile pickedFile){
    print("checkvetsign");
    var vetRef=FirebaseFirestore.instance.collection("Tüm Hayvanlar").doc(status);
    vetRef.get().then((doc) => {
      print("if üstü"),
      if(doc.exists){
        print("statü if içi"),

      }
      else{
        addMilk(status,genderStat ,saleStat,sickStat,milkStat,mailAdresi,priceStat,telNo,pickedFile ?? '')
      }

    });
  }


  Future<Status> addStatus(String status,String genderStat,String saleStat,String sickStat ,String milkStat,String mailAdresi,String priceStat,String telNo,XFile pickedFile,BuildContext context) async {


    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));


    await _firestore
        .collection("Tüm Hayvanlar")
        .doc(status)
        .set({'Küpe No': status,'Cinsiyeti':genderStat,'Satılık Durumu':saleStat,'Hastalık Durumu':sickStat,'Süt Durumu':milkStat,'Sahip Mail':mailAdresi,'Fiyat Bilgisi':priceStat,'Sahip Tel No':telNo,'image': mediaUrl}).whenComplete(() => toastMessage(context));


    return Status(id: _firestore.doc(status).id, status: status, image: mediaUrl);
  }

  Future<Status> addSick(String status,String genderStat,String saleStat,String sickStat ,String milkStat,String mailAdresi,String priceStat,String telNo,XFile pickedFile) async {
    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));


    await _firestore
        .collection("Hasta Hayvanlar")
        .doc(status)
        .set({'Küpe No': status,'Cinsiyeti':genderStat,'Satılık Durumu':saleStat,'Hastalık Durumu':sickStat,'Süt Durumu':milkStat,'Sahip Mail':mailAdresi,'Fiyat Bilgisi':priceStat,'Sahip Tel No':telNo,'image': mediaUrl});


    return Status(id: _firestore.doc(sickStat).id, status: status, image: mediaUrl);
  }

  Future<Status> addSale(String status,String genderStat,String saleStat,String sickStat ,String milkStat,String mailAdresi,String priceStat,String telNo,XFile pickedFile) async {
    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));


    await _firestore
        .collection("Satılık Hayvanlar")
        .doc(status)
        .set({'Küpe No': status,'Cinsiyeti':genderStat,'Satılık Durumu':saleStat,'Hastalık Durumu':sickStat,'Süt Durumu':milkStat,'Sahip Mail':mailAdresi,'Fiyat Bilgisi':priceStat,'Sahip Tel No':telNo,'image': mediaUrl});


    return Status(id: _firestore.doc(saleStat).id, status: status, image: mediaUrl);
  }

  Future<Status> addMilk(String status,String genderStat,String saleStat,String sickStat ,String milkStat,String mailAdresi,String priceStat,String telNo,XFile pickedFile) async {
    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));


    await _firestore
        .collection("Süt Durumu")
        .doc(status)
        .set({'Küpe No': status,'Cinsiyeti':genderStat,'Satılık Durumu':saleStat,'Hastalık Durumu':sickStat,'Süt Durumu':milkStat,'Sahip Mail':mailAdresi,'Fiyat Bilgisi':priceStat,'Sahip Tel No':telNo,'image': mediaUrl});

//değiştirmeyi unutma sickstatı-++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
    return Status(id: _firestore.doc(milkStat).id, status: status, image: mediaUrl);
  }


  //status göstermek için
  Stream<QuerySnapshot> getVetStatus() {
    var ref = _firestore.collection("Hasta Hayvanlar").snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getSalesmanStatus() {
    var ref = _firestore.collection("Satılık Hayvanlar").snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getMailStatus(String MSmail) {
    var ref = _firestore.collection("Tüm Hayvanlar").where('Sahip Mail',isEqualTo: MSmail).snapshots();

    return ref;
  }

  Stream<QuerySnapshot> getSickStatus(String MSmail) {
    var ref = _firestore.collection("Hasta Hayvanlar").where('Sahip Mail',isEqualTo: MSmail).snapshots();

    return ref;
  }
  Stream<QuerySnapshot> getSaleStatus(String MSmail) {
    var ref = _firestore.collection("Satılık Hayvanlar").where('Sahip Mail',isEqualTo: MSmail).snapshots();

    return ref;
  }
  Stream<QuerySnapshot> getMilkStatus(String MSmail) {
    var ref = _firestore.collection("Süt Durumu").where('Sahip Mail',isEqualTo: MSmail).snapshots();

    return ref;
  }

  //status silmek için
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Tüm Hayvanlar").doc(docId).delete();

    return ref;
  }

  Future<void> removeSaleStatus(String docId) {

    var refSale = _firestore.collection("Satılık Hayvanlar").doc(docId).delete();

    return refSale;
  }

  Future<void> removeSickStatus(String docId) {
    var refSick = _firestore.collection("Hasta Hayvanlar").doc(docId).delete();

    return refSick;
  }

  Future<void> removeMilkStatus(String docId) {
    var refMilk = _firestore.collection("Süt Durumu").doc(docId).delete();

    return refMilk;
  }



}