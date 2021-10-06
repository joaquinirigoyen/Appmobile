import 'package:flutter/material.dart';
import 'suplies.dart';
import '../paginas.dart';

// ignore: camel_case_types
class Gimnasio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Gimnasio EPET 20"),
        ),
      ),
      drawer: MenuLateral(),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
        children: <Widget>[
          Muestra(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.festival),
                splashRadius: 100,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Suplies()));
                },
                tooltip: 'Suministros',
              ),
            ),
            text: 'suministros del gimnasio',
          ),
          Muestra(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.assignment_sharp),
                splashRadius: 100,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Suplies()));
                },
                tooltip: 'Especificaciones',
              ),
            ),
            text: 'Especificaciones',
          ),
          Muestra(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.assignment_late_rounded),
                splashRadius: 100,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Suplies()));
                },
                tooltip: 'Reglas',
              ),
            ),
            text: 'Reglas del gimnasio',
          ),
          Muestra(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.sports_basketball_rounded),
                splashRadius: 100,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Suplies()));
                },
                tooltip: 'Equipo',
              ),
            ),
            text: 'Equipo del gimnasio',
          ),
        ],
      ),
    );
  }
}

class Muestra extends StatelessWidget {
  final Widget child;
  final String text;

  const Muestra({
    Key key,
    @required this.child,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              this.child,
              SizedBox(
                height: 20,
                width: 200,
              ),
              Text(
                this.text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
