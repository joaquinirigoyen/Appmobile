import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Controller extends GetxController {
  var _googleSignIn = GoogleSignIn();
  // ignore: null_check_always_fails
  var googleAccount = Rx<GoogleSignInAccount?>(null);

<<<<<<< HEAD
  login() async {
    googleAccount.value = (await _googleSignIn.signIn())!;
  }

  logout() async {
    googleAccount.value = (await _googleSignIn.signOut())!;
=======
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
>>>>>>> 6e56f94e146c04d8e58c348a6ba1e626832dcfa8
  }
}
