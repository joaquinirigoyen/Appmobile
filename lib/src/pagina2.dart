import 'package:app_gym/main.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Gimnasio EPET 20"),
          ),
        ),
        body: Container(
          child: Center(
            child: Text(
              "Pantalla de busqueda",
              style: TextStyle(fontSize: 20),
            ),
          ),
          color: Colors.grey,
        ),
        floatingActionButton: Botonflotante(),
        bottomNavigationBar: NavegacionBoton(),
      ),
    );
  }
}
