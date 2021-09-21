import 'package:app_gym/src/paginas.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "gimnasio epet 20",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            child: SignInButton(
              buttonType: ButtonType.google,
              onPressed: () => Get.toNamed("/Register"),
            ),
          ),
          Container(
            child: SignInButton(
              buttonType: ButtonType.google,
              onPressed: () => Get.toNamed("/loginpage"),
            ),
          ),
        ],
      ),
    );
  }
}
