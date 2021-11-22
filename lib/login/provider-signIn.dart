import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Controller extends GetxController {
  var _googleSignIn = GoogleSignIn();
  // ignore: null_check_always_fails
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = (await _googleSignIn.signIn())!;
  }

  logout() async {
    googleAccount.value = (await _googleSignIn.signOut())!;
  }
}
