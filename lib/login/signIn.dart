import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_gym/UX/userModel.dart';
import 'package:app_gym/UI/src/paginas.dart';
import 'Login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // definiendo el mensaje del error
  String? errorMessage;

  //key para las validaciones
  final _formKey = GlobalKey<FormState>();
  // controladores de texto
  final nombreCompletoEditingController = new TextEditingController();
  final dniEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //campo de texto para el nombre
    final nombreCompletoField = TextFormField(
        autofocus: false,
        controller: nombreCompletoEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("El campo no puede estar vacío");
          }
          if (!regex.hasMatch(value)) {
            return ("Ingrese un nombre y apellido válido: (Min. 3 Carácteres)");
          }
          return null;
        },
        onSaved: (value) {
          nombreCompletoEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nombre y Apellido",
          border: UnderlineInputBorder(),
        ));

    //campo de texto para el DNI
    final dniField = TextFormField(
        autofocus: false,
        controller: dniEditingController,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return ("El D.N.I no puede estar vacío");
          }
          return null;
        },
        onSaved: (value) {
          dniEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "D.N.I",
          border: UnderlineInputBorder(),
        ));

    //campo de texto para el email
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Porfavor ingrese su Email");
          }
          //expresión valida para el email
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Por Favor Ingrese un Email Válido");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
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

    //campo de texto para la contraseña
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("La contraseña es necesaria para registarse");
          }
          if (!regex.hasMatch(value)) {
            return ("Ingrese una contraseña válida(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key_outlined,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Contraseña",
          border: UnderlineInputBorder(),
        ));

    //campo de texto para confirmar contraseña
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text !=
              passwordEditingController.text) {
            return "Las contraseñas no coinciden";
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key_outlined,
            color: Colors.black,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirmar Contraseña",
          border: UnderlineInputBorder(),
        ));

    //boton registrarse
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepPurple[400],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            //llama a la funcion signUp para registrarse
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "Registrarse",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(90),
                        elevation: 6,
                        child: CircleAvatar(
                          radius: 90,
                          backgroundImage: AssetImage("assets/logo_epet.png"),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //listando los campos de texto
                      SizedBox(height: 45),
                      nombreCompletoField,
                      SizedBox(height: 20),
                      dniField,
                      SizedBox(height: 20),
                      emailField,
                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: 20),
                      confirmPasswordField,
                      SizedBox(height: 20),
                      signUpButton,
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Ya estas registrado? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                    color: Colors.deepPurple[400],
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

//funcion signUp para registrase
  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
        //casos de errores al registrarse
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "email-inválido":
            errorMessage = "Su email tiene un parámetro incorrecto.";
            break;
          case "contraseña-incorrecta":
            errorMessage = "Su contraseña es incorrecta.";
            break;
          case "usuario-no-encontrado":
            errorMessage = "Su usuario con este email no existe.";
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
            errorMessage = "Ocurrió un error indefinido.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // llama a firebase

    // envía estos valores

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? usuario = _auth.currentUser;
    // llama al user model
    UsuarioModel usuarioModel = UsuarioModel();

    // escribe estos valores
    usuarioModel.email = usuario!.email;
    usuarioModel.uid = usuario.uid;
    usuarioModel.nombreCompleto = nombreCompletoEditingController.text;
    usuarioModel.dni = dniEditingController.text;

//crea la coleccion usuarios en firebase cloud
    await firebaseFirestore
        .collection("usuarios")
        .doc(usuario.uid)
        .set(usuarioModel.toMap());
    //mensaje que muestra cuando la cuenta es creada
    Fluttertoast.showToast(msg: "Cuenta Creada Exitosamente!");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => MyApp()), (route) => false);
  }
}
