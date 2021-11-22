import 'package:flutter/material.dart';
import 'paginas.dart';

class Covid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[400],
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
                      builder: (BuildContext context) => MyApp()));
                },
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.grey[400],
                child: ListTile(
                  title: Text(
                    '¡Sigamos cuidandonos!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 50, height: 50),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/covid.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
