import 'package:flutter/material.dart';
import 'package:google_auth/controller/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(''),
      ),
      body: loginUi(),
    );
  }

  // login Ui

  loginUi() {
    return Consumer<LoginController>(builder: (context, model, child) {
      // if we are already logged in
      if (model.userDetailsModel != null) {
        return Center(
          child: loggedInUI(model),
        );
      } else {
        return loginController(context);
      }
    });
  }

  loggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetailsModel!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.userDetailsModel!.displayName ?? ''),
        Text(model.userDetailsModel!.email ?? ''),
        // logout
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: () {
            Provider.of<LoginController>(context, listen: false).logout();
          },
        )
      ],
    );
  }

  loginController(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Provider.of<LoginController>(context, listen: false)
                    .googleLogin();
              },
              child: Text('Sign In with google')),
          const SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
}
