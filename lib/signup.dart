import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class signupPage extends StatelessWidget {
  const signupPage({Key? key}) : super(key: key);

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
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.black,
        width: 500,
        child: Column(
          children: [
            Container(
              child: TextField(decoration: InputDecoration(hintText: "Email")),
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
            ),
            Container(
              child:
                  TextField(decoration: InputDecoration(hintText: "Username")),
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            ),
            Container(
              child:
                  TextField(decoration: InputDecoration(hintText: "Password")),
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            ),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5)),
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
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
