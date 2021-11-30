
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:mooapp/service/authMalSahibi.dart';
import 'package:mooapp/service/status_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mooapp/pages/status_list.dart';



class AddStatusPage extends StatefulWidget {
  @override
  _AddStatusPageState createState() => _AddStatusPageState();

}




class _AddStatusPageState extends State<AddStatusPage> {

  int genderValue=1;
  int sickValue=1;
  int saleValue=1;
  int milkValue=1;


  TextEditingController codeController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController sickController = TextEditingController();
  TextEditingController saleController = TextEditingController();
  TextEditingController milkController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController telNoController = TextEditingController();

  String telNo='';



  StatusService _statusService = StatusService();

  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var profileImage;
  var location=new Location();






  Widget imagePlace() {
    double height = MediaQuery.of(context).size.height;
    if (profileImage != null) {
      return CircleAvatar(
          backgroundImage: FileImage(File(profileImage.path)),
          radius: height * 0.04);
    } else {
      if (_pickImage != null) {
        return CircleAvatar(
          backgroundImage: NetworkImage(_pickImage),
          radius: height * 0.04,
        );
      } else
        return CircleAvatar(
          backgroundImage: AssetImage("assets/images/addPhoto.png"),
          radius: height * 0.04,
        );
    }

  }

  @override

  Widget build(BuildContext context) {
    String mailAdresi='';
    String telNo='';



    authMalSahibiSetterTel(telNoController.text);

print("---------telnoController.text deneme -----------");
print(telNoController.text);
    print("---------telnoController.text deneme -----------");

    genderController.text="Erkek";
    sickController.text="Evet";
    saleController.text="Evet";
    print("addStatus deneme");
    print(authMalSahibiGetter(mailAdresi));
    print("addStatus deneme");

       FirebaseFirestore.instance
        .collection('Mal Sahibi')
        .doc(authMalSahibiGetter(mailAdresi))
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {

         telNo=('${documentSnapshot['Telefon No']}');

print("---------------------- telefon no---------");
print(telNo);
        print("---------------------- telefon no---------");

      } else {
        print('Document does not exist on the database');
      }
    });

    var size = MediaQuery.of(context).size;
    return MaterialApp(

      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context)   ;  },
            ),
            title: Text('HAYVAN EKLE',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 20.0,
                    color: Color(0xFF545D68))),
          ),
          body: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * .7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text(

                            "Küpe NO (Max 5 Hane):",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                              ],
                            keyboardType: TextInputType.number,
                              controller: codeController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Color(0xfff3f3f4),
                                  filled: true))
                        ],
                      ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(

                                "Fiyatı :",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                  keyboardType: TextInputType.number,
                                  controller: priceController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Color(0xfff3f3f4),
                                      filled: true))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 62,),
                                Text("Cinsiyeti:",style: TextStyle(fontSize: 17),),
                                Radio(value: 1, groupValue: genderValue, onChanged: (value){
                                  setState(() {

                                    genderValue=value;
                                    genderController.text="Erkek";
                                    print(genderController.text.toString());

                                    print(genderValue);
                                  });
                                }),
                                Text("Erkek",style: TextStyle(fontSize: 16)),
                                SizedBox(width: 23,),
                                Radio(value: 2, groupValue: genderValue, onChanged: (value){
                                  setState(() {
                                    genderValue=value;
                                    genderController.text="Dişi";
                                    print(genderController.text.toString());
                                    print(genderValue);

                                  });


                                }),
                                Text("Dişi",style: TextStyle(fontSize: 16)),
                              ],),

                              Row(
                                children: [
                                  Text("Hastalık Durumu:",style: TextStyle(fontSize: 17),),
                                  Radio(value: 1, groupValue: sickValue, onChanged: (value){
                                    setState(() {
                                      sickValue=value;
                                      sickController.text="Evet";
                                      print(sickController.text.toString());
                                      print(sickValue);

                                    });
                                  }),
                                  Text("Evet",style: TextStyle(fontSize: 16)),
                                  SizedBox(width: 33,),
                                  Radio(value: 2, groupValue: sickValue, onChanged: (value){
                                    setState(() {
                                      sickValue=value;
                                      sickController.text="Hayır";
                                      print(sickController.text.toString());
                                      print(sickValue);
                                    });
                                  }),
                                  Text("Hayır",style: TextStyle(fontSize: 16)),
                                ],),
                              Row(
                                children: [

                                  Text("Satılık Durumu:",style: TextStyle(fontSize: 17),),
                                  SizedBox(width: 16,),
                                  Radio(value: 1, groupValue: saleValue, onChanged: (value){
                                    setState(() {
                                      saleValue=value;
                                      saleController.text="Evet";
                                      print(saleController.text.toString());
                                    });
                                  }),
                                  Text("Evet",style: TextStyle(fontSize: 16)),

                                  SizedBox(width: 33,),
                                  Radio(value: 2, groupValue: saleValue, onChanged: (value){
                                    setState(() {
                                      saleValue=value;
                                      saleController.text="Hayır";
                                      print(saleController.text);
                                    });
                                  }),
                                  Text("Hayır",style: TextStyle(fontSize: 16)),
                                ],),
                              Row(
                                children: [
                                  SizedBox(width: 38,),
                                  Text("Süt Durumu:",style: TextStyle(fontSize: 17),),
                                  Radio(value: 1, groupValue: milkValue, onChanged: (value){
                                    setState(() {

                                      milkValue=value;
                                      milkController.text="Evet";
                                      print(milkController.text.toString());

                                      print(milkValue);
                                    });
                                  }),
                                  Text("Evet",style: TextStyle(fontSize: 16)),



                                  SizedBox(width: 33,),
                                  Radio(value: 2, groupValue: milkValue, onChanged: (value){
                                    setState(() {

                                      milkValue=value;
                                      milkController.text="Hayır";
                                      print(milkController.text.toString());
                                      print(milkValue);
                                    });
                                  }),
                                  Text("Hayır",style: TextStyle(fontSize: 16)),
                                ],),

                            ],
                          ),



                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: imagePlace(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(

                                  onTap: () => _onImageButtonPressed(
                                      ImageSource.camera,
                                      context: context),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 25,
                                    color: Colors.blue,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () => _onImageButtonPressed(
                                      ImageSource.gallery,
                                      context: context),
                                  child: Icon(
                                    Icons.image,
                                    size: 25,
                                    color: Colors.blue,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(

                    padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
                  child: InkWell(
                    onTap: () {

                      if(genderValue==1){
                        genderController.text="Erkek";
                      }
                      else if(genderValue==2){
                        genderController.text="Dişi";
                      }


                      if(sickValue==1){
                        sickController.text="Evet";
                      }
                      else if(sickValue==2){
                        sickController.text="Hayır";
                      }


                      if(saleValue==1){
                        saleController.text="Evet";
                      }
                      else if(saleValue==2){
                        saleController.text="Hayır";
                      }

                      if(milkValue==1){
                        milkController.text="Evet";
                      }
                      else if(milkValue==2){
                        milkController.text="Hayır";
                      }


                      if(sickValue==1)
                      {
                        print("sickValue 1");
                        _statusService
                            .checkSickStatus(codeController.text,genderController.text ,saleController.text,sickController.text,milkController.text,authMalSahibiGetter(mailAdresi),priceController.text,telNo,profileImage ?? '');
                      }

                      if(saleValue==1)
                      {
                        print("saleValue 1");

                        _statusService
                            .addSale(codeController.text,genderController.text ,saleController.text,sickController.text,milkController.text,authMalSahibiGetter(mailAdresi),priceController.text,telNo,profileImage ?? '');
                      }

                      if(milkValue==1)
                      {
                        print("milkValue 1");
                        _statusService
                            .checkMilkStatus(codeController.text,genderController.text ,saleController.text,sickController.text,milkController.text,authMalSahibiGetter(mailAdresi),priceController.text,telNo,profileImage ?? '');
                      }





                      _statusService
                          .checkStatus(codeController.text,genderController.text ,saleController.text,sickController.text,milkController.text,authMalSahibiGetter(mailAdresi),priceController.text,telNo,profileImage ?? '',context);
                      /*_statusService
                          .addStatus(codeController.text,genderController.text ,saleController.text,sickController.text,milkController.text,profileImage ?? '')
                          .then((value) {
                        print("status içinde deneme");
                        print(genderController.text);
                        Fluttertoast.showToast(
                            msg: "Durum eklendi!",
                            timeInSecForIosWeb: 2,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey[600],
                            textColor: Colors.white,
                            fontSize: 14);

                        Navigator.pop(context);
                      });*/
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          //color: colorPrimaryShade,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                            child: Text(
                              "Ekle",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _onImageButtonPressed(ImageSource source,
      {BuildContext context}) async {
    try {
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        profileImage = pickedFile;
        print("dosyaya geldim: $profileImage");
        if (profileImage != null) {}
      });
      print('aaa');
    } catch (e) {
      setState(() {
        _pickImage = e;
        print("Image Error: " + _pickImage);
      });
    }
  }
}