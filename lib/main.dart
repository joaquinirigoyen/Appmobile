import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("mi primera app")), //appbar
          body: Container(
              child: Center(
            child: Text(
              "hello word",
              style: TextStyle(fontSize: 40),
            ),
          ))));

  runApp(app);
}
