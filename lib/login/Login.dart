import 'package:app_gym/login/provider-signIn.dart';
import 'package:flutter/material.dart';
import 'signIn.dart';
import 'package:app_gym/widgets/header.dart';
import 'package:app_gym/widgets/logo.dart';
import 'package:app_gym/widgets/textField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
import 'package:app_gym/UI/src/paginas.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
          _ForgotPassword(),
          SizedBox(height: 40),
          _BottonSignIn(),
          _GoogleSignIn(),
        ],
      ),
    ));
  }
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
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => MyApp()));

          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => MyApp()));
        },
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25, top: 20),
      alignment: Alignment.centerRight,
      child: Text('Forgot Password?'),
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
  final controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Obx(() {
        // ignore: unnecessary_null_comparison
        if (controller.googleAccount.value == null)
          return buildLoginButton();
        else
          return buildProfileView();
      }),
    );
  }

  FloatingActionButton buildLoginButton() {
    return FloatingActionButton.extended(
      backgroundColor: Colors.deepPurple[300],
      icon: FaIcon(FontAwesomeIcons.google, color: Colors.black),
      label: Text('Iniciar sesion con google'),
      onPressed: () {
        controller.login();
      },
    );
  }

  Column buildProfileView() {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      CircleAvatar(
        backgroundImage:
            Image.network(controller.googleAccount.value?.photoUrl ?? '').image,
        radius: 100,
      ),
      Text(controller.googleAccount.value?.displayName ?? '',
          style: Get.textTheme.headline3),
      Text(controller.googleAccount.value?.email ?? '',
          style: Get.textTheme.bodyText1),
      SizedBox(height: 16),
      ActionChip(
        avatar: Icon(Icons.logout),
        label: Text('Salir'),
        onPressed: () {
          controller.logout();
        },
      ),
      ActionChip(
          avatar: Icon(Icons.arrow_forward),
          label: Text('Entrar'),
          onPressed: () {}),
    ]);
  }
}
