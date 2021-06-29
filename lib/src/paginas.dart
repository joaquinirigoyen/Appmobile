import 'package:flutter/material.dart';

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
            accountName: Text("APPTIVAWEB"),
            accountEmail: Text("informes@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: Colors.blue,
            child: new ListTile(
              title: Text(
                "Usuario",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Pagina2()));
              },
            ),
          ),
          new ListTile(
            title: Text(
              "Gimnasio",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          ),
          new ListTile(
            title: Text(
              "Contacto",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          ),
          new ListTile(
            title: Text(
              "Turnos",
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
