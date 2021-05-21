import 'package:flutter/material.dart';
void main() {
  var app = MaterialApp(
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
        body: Column(
          children: <Widget>[
            Container(
              color:Colors.orange
              width: 200,
              height: 200,
            ),
          ]
        ),
      ),
    ),
  );

  runApp(app);
}



 );
  }
}


