import 'package:flutter/material.dart';

class Loginpagina extends StatefulWidget {
  static String id = 'Loginpagina';

  @override
  _LoginpaginaState createState() => _LoginpaginaState();
}

class _LoginpaginaState extends State<Loginpagina> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.0,
              ),
              _userTexField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTexField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                icon: Icon(Icons.near_me),
                hintText: 'Ejemplo juan',
                labelText: 'Nombre'),
            onChanged: (value) {},
          ),
        );
      },
    );
  }
}

