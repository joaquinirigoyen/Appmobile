import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_gym/UI/src/paginas.dart';
import 'package:app_gym/login/signIn.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // key del form
  final _formKey = GlobalKey<FormState>();

  // controladores de texto
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // definiendo el mensaje de error
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //campo de texto del email

    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por Favor Ingrese su Email: ");
          }
          // expresiones válidas para un email
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Por Favor ingrese un Email Válido: ");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: UnderlineInputBorder(),
        ));

    //campo de texto de la contraseña
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          //la contraseña no puede tener menos de 6 dígitos
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("La contraseña es necesaria para registrarse");
          }
          if (!regex.hasMatch(value)) {
            return ("Ingresar una contraseña valida: (Min. 6 Carácteres)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key_outlined,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          border: UnderlineInputBorder(),
        ));

    //definiendo el boton login
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //llama a la funcion signIn
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Iniciar Sesión",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Gimnasio EPET20"),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo_epet.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(height: 10),
                      emailField,
                      SizedBox(height: 25),
                      passwordField,
                      SizedBox(height: 35),
                      loginButton,
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("No estas registrado todavía? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                              child: Text(
                                "Regístrate",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // funcion signIn a la que se llamo en el botón login
  void signIn(String email, String password) async {
    //valida que el email y la contraseña sean de una cuenta ya creada
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "SESIÓN INICIADA CORRECTAMENTE"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyApp())),
                });
        //tipos de errores
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "email-inválido":
            errorMessage = "Su email tiene un parámetro incorrecto.";
            break;
          case "contraseña-incorrecta":
            errorMessage = "Su contraseña no es correcta.";
            break;
          case "usuario-no-encontrado":
            errorMessage = "Su usuario no esta registrado.";
            break;
          case "usuario-deshabilitado":
            errorMessage = "El usuario con este email ha sido deshabilitado.";
            break;
          case "demasiadas-solicitudes":
            errorMessage = "Demasiadas solicitudes";
            break;
          case "operacion-no-permitida":
            errorMessage =
                "Iniciar sesión con email y contraseña no está habilitado.";
            break;
          default:
            errorMessage = "Ocurrió un error inesperado.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
