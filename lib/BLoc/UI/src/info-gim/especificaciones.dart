import 'package:flutter/material.dart';
import '../paginas.dart';
import 'package:url_launcher/url_launcher.dart';

class Especificaciones extends StatelessWidget {
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
                        child: Icon(Icons.account_balance_outlined),
                        onPressed: () {
                          launch(
                              "https://drive.google.com/drive/folders/1b7895QSbCh-Cqfa_6XnUorpv6d04UvPM?usp=sharing");
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Text("¡Especificaciones del gimnasio!"),
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
