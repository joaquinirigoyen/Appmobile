import 'package:flutter/material.dart';
import 'package:app_gym/login/Login.dart';

class MyRoutes {
  static Map<String, Widget Function(BuildContext)> get routes => {
        "/login": (_) => LoginPage(),
      };
}
