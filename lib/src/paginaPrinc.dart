import 'package:app_gym/main.dart';
import 'package:flutter/material.dart';

class  extends StatelessWidget {
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
