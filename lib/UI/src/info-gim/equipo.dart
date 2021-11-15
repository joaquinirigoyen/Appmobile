import 'package:flutter/material.dart';
import '../paginas.dart';
import 'package:url_launcher/url_launcher.dart';

class Equipo extends StatelessWidget {
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
                        child: Icon(Icons.sports_basketball_rounded),
                        onPressed: () {
                          launch(
                              "https://docs.google.com/document/d/155mDxtm-EIvlhO13v_E5iNqdpOiqRd12/edit?usp=sharing&ouid=103558025353731323276&rtpof=true&sd=true");
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    Text("¡Equipo del gimnasio!"),
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
