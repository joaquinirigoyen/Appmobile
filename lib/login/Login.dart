import 'package:app_gym/UI/src/paginas.dart';
import 'package:app_gym/login/provider-signIn.dart';
import 'package:flutter/material.dart';
import 'package:app_gym/login/signIn.dart';
import 'package:app_gym/widgets/header.dart';
import 'package:app_gym/widgets/logo.dart';
import 'package:app_gym/widgets/textField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          home: Scaffold(
            body: ListView(
              padding: EdgeInsets.only(top: 0),
              physics: BouncingScrollPhysics(),
              children: [
                Stack(
                  children: [HeaderLogin(), LogoHeader()],
                ),
                _Titulo(),
                SizedBox(height: 40),
                _EmailAndPassword(),
                SizedBox(height: 40),
                _BottonSignIn(),
                _GoogleSignIn(),
              ],
            ),
          ),
        ),
      );
}

class _BottonSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: Text('iniciar sesion',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => MyApp()));
        },
      ),
    );
  }
}

class _EmailAndPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          TextFieldCustom(
              icono: Icons.mail_outline,
              type: TextInputType.emailAddress,
              texto: 'Direccion de e-mail'),
          SizedBox(height: 20),
          TextFieldCustom(
              icono: Icons.visibility_off,
              type: TextInputType.text,
              pass: true,
              texto: 'Contraseña'),
        ],
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text('SIGN IN',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text('/', style: TextStyle(fontSize: 25, color: Colors.grey)),
          TextButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SignUpPage())),
              child: Text('SIGN UP',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)))
        ],
      ),
    );
  }
}

class _GoogleSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: FloatingActionButton.extended(
          backgroundColor: Colors.deepPurple[300],
          icon: FaIcon(FontAwesomeIcons.google, color: Colors.black),
          label: Text('Iniciar sesion con google'),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          }),
    );
  }
}
