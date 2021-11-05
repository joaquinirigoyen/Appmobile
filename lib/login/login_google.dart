import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Controller extends GetxController {
  var _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount>(null);

  login() async {
    googleAccount.value = await _googleSignIn.signIn();
  }

  logut() async {
    googleAccount.value = await _googleSignIn.signOut();
  }
}
