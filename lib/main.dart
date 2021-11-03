import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app_gym/BLoc/login/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPage());
}



//void getUsers() async {
  //CollectionReference collectionReference =
    //  FirebaseFirestore.instance.collection("usuarios");
  //QuerySnapshot usuarios = await collectionReference.get();

  //if (usuarios.docs.length != 0) {
    //for (var doc in usuarios.docs) {
      //print(doc.data()); }}}
