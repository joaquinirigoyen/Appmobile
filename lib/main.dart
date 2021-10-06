import 'package:flutter/material.dart';
import 'package:app_gym/BLoc/UI/src/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    navigatorKey: Get.key,
    getPages: routes(),
  ));
}


//void getUsers() async {
  //CollectionReference collectionReference =
    //  FirebaseFirestore.instance.collection("usuarios");
  //QuerySnapshot usuarios = await collectionReference.get();

  //if (usuarios.docs.length != 0) {
    //for (var doc in usuarios.docs) {
      //print(doc.data()); }}}
