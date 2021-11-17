import 'package:app_gym/login/provider-signIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class User extends StatelessWidget {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Gimnasio EPET 20"),
        ),
      ),
      body: Column(
        children: [
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            CircleAvatar(
              backgroundImage:
                  Image.network(controller.googleAccount.value?.photoUrl ?? '')
                      .image,
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
          ]),
        ],
      ),
    );
  }
}
