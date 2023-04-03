
import 'package:flutter/material.dart';

class UserEmailDetails extends StatefulWidget {
  final String email;
  final String name;
   final String urlImage;

   UserEmailDetails({Key? key, required this.email, required this.name, required this.urlImage}) : super(key: key);

  @override
  State<UserEmailDetails> createState() => _UserEmailDetailsState();
}

class _UserEmailDetailsState extends State<UserEmailDetails> {
  @override
  void initState() {
    print('hhhasjkdfadsadsfhjdfdjklajkldfjkladfadsfjkldsljkfadshjfhj');
    print(widget.email);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details'),),
      body: Column(
        children: [
          Text(widget.name),
          Text(widget.email),
          //Text(widget.urlImage)

        ],
      ),
    );
  }
}
