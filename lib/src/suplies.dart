import 'package:flutter/material.dart';
import 'paginas.dart';

class Suplies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Gimnasio EPET20"),
        ),
      ),
      drawer: MenuLateral(),
      body: Container(
        child: Center(
          child: Text(
            "Suministros del gimnasio",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
