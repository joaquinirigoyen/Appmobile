import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
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
        backgroundColor: Colors.orange,
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
            accountName: Text("Proyecto"),
            accountEmail: Text("Benjamin.quiroga.epet20@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "data:image/jpeg;base64,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"),
                    fit: BoxFit.cover)),
          ),
          Ink(
            color: Colors.orange,
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
