import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_auth/model/user_details_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController with ChangeNotifier {
  var _googleSingnIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetailsModel? userDetailsModel;

  // function for google signIn

  googleLogin() async {
    googleSignInAccount = await _googleSingnIn.signIn();
    // inserting values to our user details model
    userDetailsModel = UserDetailsModel(
      displayName: googleSignInAccount!.displayName,
      email: googleSignInAccount!.email,
      photoUrl: googleSignInAccount!.photoUrl,
    );
    notifyListeners();
  }

  //logout

  logout() async {
    googleSignInAccount = await _googleSingnIn.signOut();
    await FacebookAuth.i.logOut();
    userDetailsModel = null;
    notifyListeners();
  }

  // function for facebook login
  facebooklogin() async {
    var result = await FacebookAuth.i.login(
        permissions: ["public_profile", "email"]
    );
    // check the status of our login
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
          fields: "email,name,picture"
      );

      userDetailsModel = UserDetailsModel(
        displayName: requestData["name"],
        email: requestData["email"],
        photoUrl: requestData["picture"]["data"]["url"] ?? " ",
      );
      notifyListeners();
    }
  }
}