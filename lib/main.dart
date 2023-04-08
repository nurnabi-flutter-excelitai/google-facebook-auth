import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/controller/login_controller.dart';
import 'package:google_auth/screens/login_page.dart';
import 'package:google_auth/screens/user_email_details.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  // this is the first widget
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController(),
          child: LoginScreen(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {





  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: [
        'email'
      ]
    ).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {


    final currentUser = FirebaseAuth.instance.currentUser;

    print('Helllllllllllllllllllllllllllllllllklolllllhjkghjfghjfg');
    print(currentUser?.email);
    print(currentUser?.displayName);


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            if(currentUser == null)
              ElevatedButton(onPressed: (){
                final credential = signInWithGoogle().then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> UserEmailDetails(
                  email: currentUser!.email.toString(),
                  name: currentUser.displayName.toString() ,
                  urlImage: currentUser.photoURL.toString() ,
                ))));



                setState((){

                });
              }, child: Text('Sign In By google')),


            if(currentUser != null)
           ElevatedButton(onPressed: () async{
             await FirebaseAuth.instance.signOut();

             setState((){
             });
           }, child: Text('Sign out')),

          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
