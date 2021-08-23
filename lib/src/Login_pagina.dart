import 'package:app_gym/src/paginas.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Login_pag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Gimnasio EPET20"),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: NetworkImage(
                    "https://www.google.com/search?q=logo+epet+20&sxsrf=ALeKk01jXKKsSD3LWp0inaMe8zFRW0zy8Q:1624997193791&tbm=isch&source=iu&ictx=1&fir=sqlfE3iWRg_SIM%252Cu_KQe-Gx7poloM%252C_&vet=1&usg=AI4_-kRKK02EgCRynobji7D_VunZl7s7Ww&sa=X&ved=2ahUKEwiVpfyj0r3xAhW0qZUCHXcoAdQQ9QF6BAgIEAE&biw=1366&bih=657#imgrc=sqlfE3iWRg_SIM"),
              ),
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
              SizedBox(
                height: 20.0,
              ),
              _bottonRegister(),
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
        color: Colors.blue[600],
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyApp()));
        },
      );
    },
  );
}

Widget _bottonRegister() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(
            'REGISTRARSE',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 15.0,
        color: Colors.blue[600],
        onPressed: () {},
      );
    },
  );
}
