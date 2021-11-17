import 'package:flutter/material.dart';
import '../paginas.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      child: Icon(Icons.festival),
                      onPressed: () {
                        launch(
                            "https://docs.google.com/document/d/12zE08ETn7PshtPyGliFpROUVGQXzLSSG/edit?usp=sharing&ouid=103558025353731323276&rtpof=true&sd=true");
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Text("¡Suministros del gimnasio!"),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
