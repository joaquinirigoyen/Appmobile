import 'package:app_gym/Login_pagina.dart';
import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("mi primera app"),
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            "hello word",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Botonflotante(),
      bottomNavigationBar: NavegacionBoton(),
    ),
  );

  runApp(app);
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Loginpagina.id,
      routes: {
        Loginpagina.id: (context) => Loginpagina(),
      },
    );
  }
}

class NavegacionBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        // ignore: deprecated_member_use
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.access_alarm_sharp),
            // ignore: deprecated_member_use
            title: Text("Alarma")),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.ac_unit_outlined),
            // ignore: deprecated_member_use
            title: Text("hielo")),
      ],
    );
  }
}

class Botonflotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          // print("no tiene uso todavia");
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Pagina2()));
        });
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Botonflotante(),
      bottomNavigationBar: NavegacionBoton(),
    );
  }
}
