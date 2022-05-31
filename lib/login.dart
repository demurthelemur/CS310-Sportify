import 'package:cs310/homefeed.dart';
import 'package:flutter/material.dart';
import 'objects/styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'objects/auth.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  late String s;

  String _email = '';
  String _pass = '';
  String _username = '';

  final AuthService _auth = AuthService();

  Future loginUser() async {
    dynamic result = await _auth.loginWithEmailPass(_email, _pass);
    if (result is String) {
      return 'sign up error';
    } else if (result is User) {
      //User signed in
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return loginPage();
      }));
    } else {
      return 'signup error';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'SPORTIFY',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appbar,
      ),
      body: Container(
        color: Colors.black,
        width: 500,
        child: Column(
          children: [
            Container(
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(width: 4),
                          const Text('Email'),
                        ],
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onSaved: (value) {
                    _email = value ?? '';
                  }),
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
            ),
            Container(
              child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.password),
                          const SizedBox(width: 4),
                          const Text('Password'),
                        ],
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onSaved: (value) {
                    _pass = value ?? '';
                  }),
              color: Colors.white,
              margin: Dimensions.wPadding,
            ),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.appbar, width: 5)),
              margin: Dimensions.wPadding,
              child: OutlinedButton(
                onPressed: () async {
                  await loginUser();
                },
                child: Text(
                  "Log In",
                  style: welcomeText,
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
