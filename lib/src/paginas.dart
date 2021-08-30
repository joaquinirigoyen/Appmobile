import 'package:flutter/material.dart';
import 'calendar.dart';
import 'package:app_gym/src/Login_pagina.dart';
import 'user.dart';
import 'gimnasio.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Gimnasio EPET20"),
          ),
        ),
        drawer: MenuLateral(),
        body: Container(
          child: Center(
            child: Text(
              "Pagina principal",
              style: TextStyle(fontSize: 40),
            ),
          ),
          color: Colors.grey,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Botonflotante(),
        bottomNavigationBar: NavegacionBoton(),
      ),
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
            icon: Icon(Icons.phonelink_ring_outlined),
            // ignore: deprecated_member_use
            title: Text("Turnos telefonicos")),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.attribution_rounded),
            // ignore: deprecated_member_use
            title: Text("Covid")),
      ],
    );
  }
}

class Botonflotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.cloud),
        backgroundColor: Colors.white,
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
      appBar: AppBar(
        title: Center(
          child: Text("Gimnasio EPET 20"),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Nombre",
              style: TextStyle(fontSize: 20),
            ),
            color: Colors.black,
          ),
          Container(
            child: Text("Gimnasio"),
          ),
        ],
      ),
      floatingActionButton: Botonflotante(),
      bottomNavigationBar: NavegacionBoton(),
    );
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("Nuestro mail"),
            accountEmail: Text("joaquin.quiroga.epet20@gmail.com"),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Ink(
            child: new ListTile(
              leading: Icon(Icons.accessibility_new_rounded),
              title: Text(
                "Usuario",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => User()));
              },
            ),
          ),
          new ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text(
              "Acerca del Gimnasio",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Gimnasio()));
            },
          ),
          new ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              "Cerrar sesion",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Login_pag()));
            },
          ),
          new ListTile(
            leading: Icon(Icons.calendar_today_rounded),
            title: Text(
              "Turnos",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => calendar()));
            },
          )
        ],
      ),
    );
  }
}
