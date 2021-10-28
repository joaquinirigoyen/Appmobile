import 'package:app_gym/BLoc/UI/src/paginas.dart';
import 'package:app_gym/BLoc/login/Login.dart';
import 'package:get/route_manager.dart';

routes() => [
      GetPage(name: "/home", page: () => LoginTenPage()),
      GetPage(
          name: "/paginas.dart",
          page: () => MyApp(),
          transition: Transition.zoom),
    ];
