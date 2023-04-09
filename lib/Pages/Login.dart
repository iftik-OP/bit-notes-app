import 'package:bit_app/Pages/Dashboard.dart';
import 'package:bit_app/Pages/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
      body: Column(
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
            height: 70,
          ),
          Text(
            'LogIn',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
                decoration: InputDecoration(
                    labelText: 'College ID', hintText: 'btech2507921')),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
                decoration: InputDecoration(
                    labelText: 'Password', hintText: '************')),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 40,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => dashboard()));
              },
              child: Text('LogIn'),
              style: ButtonStyle(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => signUp()));
            },
            child: Text(
              'SignUp',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Made with ❤️ By Iftikhar',
          )
        ],
      ),
    );
  }
}
