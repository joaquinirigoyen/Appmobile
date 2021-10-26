import 'package:flutter/material.dart';
import 'suplies.dart';
import '../paginas.dart';
import 'reglas.dart';

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
            child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.blue.withAlpha(30),
                child: Icon(Icons.festival),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Suplies(),
                      ));
                }),
            text: 'suministros del gimnasio',
          ),
          Muestra(
            child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.blue.withAlpha(30),
                child: Icon(Icons.assignment_sharp),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Suplies(),
                      ));
                }),
            text: 'Especificaciones',
          ),
          Muestra(
            child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.blue.withAlpha(30),
                child: Icon(Icons.accessibility_new),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Reglas(),
                      ));
                }),
            text: 'Reglas del gimnasio',
          ),
          Muestra(
            child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.blue.withAlpha(30),
                child: Icon(Icons.sports_basketball_rounded),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Suplies(),
                      ));
                }),
            text: 'Equipo del gimnasio del gimnasio',
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
