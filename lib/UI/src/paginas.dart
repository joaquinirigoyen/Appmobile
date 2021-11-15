import 'package:app_gym/login/Login.dart';
import 'package:flutter/material.dart';
import 'calendario/calendar.dart';
import 'info-gim/gimnasio.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Gimnasio EPET20"),
          ),
        ),
        drawer: MenuLateral(),
        body: Container(
          child: ListView(),
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
        backgroundColor: Colors.white,
        onPressed: () {
          launch('');
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
              image: NetworkImage(
                  'https://www.google.com/imgres?imgurl=https%3A%2F%2Fpbs.twimg.com%2Fprofile_images%2F1010352067221782528%2Fkezuc7K5_400x400.jpg&imgrefurl=https%3A%2F%2Ftwitter.com%2Fepet20educacion&tbnid=S1zXV8fnvozkYM&vet=12ahUKEwjHxLDl0JH0AhV_N7kGHdZaBTkQMygCegUIARCnAQ..i&docid=vsMYu94ygZL42M&w=400&h=400&q=epet%2020&ved=2ahUKEwjHxLDl0JH0AhV_N7kGHdZaBTkQMygCegUIARCnAQ'),
            )),
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
