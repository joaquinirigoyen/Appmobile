import 'package:app_gym/login/Login.dart';
import 'package:flutter/material.dart';

import 'calendario/calendar.dart';
import 'info-gim/gimnasio.dart';
import 'covid.dart';
import 'info-gim/user.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Center(
            child: Text("EPET 20"),
          ),
        ),
        drawer: MenuLateral(),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.grey[400],
                child: ListTile(
                  title: Text(
                    '¡Bienvenidos!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: (FontStyle.italic),
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 50, height: 150),
              Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/eventos.png'),
                  ),
                ),
              ),
              SizedBox(width: 50, height: 120),
              Botonflotante(),
            ],
          ),
        ),
      ),
    );
  }
}

class Botonflotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.coronavirus),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Covid()));
        });
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
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo_epet.png"), fit: BoxFit.cover),
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
          SizedBox(
            height: 15,
            width: 15,
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
                  builder: (BuildContext context) => Calendar()));
            },
          ),
          SizedBox(
            height: 15,
            width: 15,
          ),
          new ListTile(
            leading: Icon(Icons.accessibility_rounded),
            title: Text(
              "Usuario",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PerfilPage()));
            },
          ),
          SizedBox(
            height: 430,
            width: 430,
          ),
          new ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Cerrar sesion",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text("Cerrar sesion"),
                          content: Text(
                            "Seguro que desea cerrar sesion?",
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text("No")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return LoginPage();
                                  }), (route) => false);
                                },
                                child: Text("Si"))
                          ],
                        ));
              }),
        ],
      ),
    );
  }
}
