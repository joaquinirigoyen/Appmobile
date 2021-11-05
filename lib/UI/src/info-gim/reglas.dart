import 'package:flutter/material.dart';
import '../paginas.dart';
import 'package:url_launcher/url_launcher.dart';

class Reglas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Gimnasio EPET20"),
        ),
      ),
      drawer: MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    OutlinedButton(
                        child: Icon(Icons.assignment_sharp),
                        onPressed: () {
                          launch(
                              "https://drive.google.com/file/d/1BOaHlgzl0AdgSdzr0kEdtTaRFloLLy_4/view?usp=sharing");
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Text("¡Reglas del gimnasio!"),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
