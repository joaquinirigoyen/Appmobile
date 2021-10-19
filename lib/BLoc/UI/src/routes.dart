import 'package:app_gym/BLoc/UI/src/paginas.dart';
import 'package:app_gym/BLoc/login/Login_pagina.dart';
import 'package:app_gym/BLoc/UI/src/register_login_page.dart';
import 'package:get/route_manager.dart';

routes() => [
      GetPage(name: "/home", page: () => LoginScreen()),
      GetPage(name: "/registration", page: () => RegisterLoginPage()),
      GetPage(name: "/login_pagina", page: () => LoginScreen()),
      GetPage(name: "/logingoogle", page: () => LoginScreen()),
      GetPage(
          name: "/paginas.dart",
          page: () => MyApp(),
          transition: Transition.zoom),
    ];
