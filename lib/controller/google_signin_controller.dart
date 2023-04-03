import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  // function for login
  login() async {
    googleSignInAccount = await _googleSignIn.signIn();

    notifyListeners();
  }

  // function to logout

  logout() async{
    // empty the value after logout
    googleSignInAccount = await _googleSignIn.signOut();
    notifyListeners();
  }

}
