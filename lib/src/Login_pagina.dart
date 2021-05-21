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

Widget _passwordTextField() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.name,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'contraseña',
              labelText: 'contraseña'),
          onChanged: (value) {},
        ),
      );
    },
  );
}

Widget _bottonLogin() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar Sesion',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 15.0,
          color: Colors.orange[600],
          onPressed: () {});
    },
  );
}
