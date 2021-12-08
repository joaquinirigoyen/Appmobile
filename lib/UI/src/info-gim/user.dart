import 'package:app_gym/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_gym/UX/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_gym/UI/src/calendario/turnos.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  User? usuario = FirebaseAuth.instance.currentUser;
  UsuarioModel loggedInUser = UsuarioModel();

  @override
  void initState() {
    super.initState();
    //crea la colección usuarios en firebase cloud
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(usuario!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UsuarioModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(
            child: Text("Gimnasio EPET20"),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyApp()));
                },
              );
            },
          ),
        ),
        body: Column(
          children: [
            Container(
                width: 400,
                height: 300,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                padding: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo_epet.png'),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        "${loggedInUser.nombreCompleto}",
                        style: TextStyle(fontSize: 20),
                      )),
                ])),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20, bottom: 10, top: 20),
                child: Text("${loggedInUser.email}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ))),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 150,
            ),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                  left: 20,
                  bottom: 10,
                ),
                child: Text("${loggedInUser.dni}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ))),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 150,
            ),
            Container(
              margin: EdgeInsets.only(top: 95),
              width: 250,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  "Mis turnos",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Turnos()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
