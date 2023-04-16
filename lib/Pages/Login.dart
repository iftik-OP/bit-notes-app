import 'package:bit_app/Pages/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIT Mesra - Jaipur'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage('lib/Images/logo.png'),
                height: 250,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'LogIn',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  SignInWithGoogle();
                },
                child: Text('SignIn with Google'),
                style: ElevatedButton.styleFrom(primary: Colors.indigo[400]),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Made with ❤️ By Iftikhar',
            )
          ],
        ),
      ),
    );
  }

  SignInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => dashboard())));
  }
}
