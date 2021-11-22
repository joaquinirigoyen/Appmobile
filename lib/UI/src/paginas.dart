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
            child: Text("Gimnasio EPET20"),
          ),
        ),
        drawer: MenuLateral(),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.grey[400],
                child: ListTile(
                  title: Text(
                    '¡Bienvenidos!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 50, height: 50),
              Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/eventos.png'),
                  ),
                ),
              ),
              SizedBox(width: 250, height: 250),
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
          new ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text(
              "Acerca del Gimnasio",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => User()));
            },
          ),
          new ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text(
              "Acerca del Gimnasio",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => User()));
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
                  builder: (BuildContext context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
