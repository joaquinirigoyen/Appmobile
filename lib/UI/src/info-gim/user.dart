import 'package:app_gym/login/provider-signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        appBar: AppBar(
          title: Text('Epet 20'),
          centerTitle: true,
          actions: [
            TextButton(
              child: Text('¡Salir!'),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.indigo[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Perfil',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 32),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(height: 8),
              Text(
                'Nombre: ' + user.displayName!,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Email: ' + user.email!,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ));
  }
}
