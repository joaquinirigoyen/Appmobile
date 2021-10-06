import 'package:app_gym/BLoc/UI/src/paginas.dart';
import 'package:app_gym/BLoc/UI/src/homepage.dart';
import 'package:app_gym/BLoc/UI/src/login_pagina.dart';
import 'package:app_gym/BLoc/UI/src/register_login_page.dart';
import 'package:get/route_manager.dart';

routes() => [
      GetPage(name: "/home", page: () => HomePage()),
      GetPage(name: "/registration", page: () => RegisterLoginPage()),
      GetPage(name: "/login_pagina", page: () => Login_Pag()),
      GetPage(name: "/logingoogle", page: () => Login_Pag()),
      GetPage(
          name: "/paginas.dart",
          page: () => MyApp(),
          transition: Transition.zoom),
    ];
