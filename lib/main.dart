import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login/Login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPage());
}
