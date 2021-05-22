import 'package:flutter/material.dart';

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
