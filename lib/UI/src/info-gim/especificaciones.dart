import 'package:app_gym/UI/src/info-gim/gimnasio.dart';
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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Gimnasio()));
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 170,
              height: 170,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(37.0, 38.0),
                  ),
                ],
                color: Colors.blueAccent[200],
              ),
              padding: EdgeInsets.all(10),
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
          ],
        ),
      ),
    );
  }
}
