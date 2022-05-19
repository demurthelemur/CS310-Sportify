import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login.dart';
import 'signup.dart';
import 'styles.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Sportify', home: WelcomePage());
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
          height: 1000,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 10)),
                child: Image.asset("assets/images/welcome.jpg"),
              ),
              Container(
                height: 60,
                width: 350,
                margin: const EdgeInsets.fromLTRB(5, 20, 100, 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return loginPage();
                    }));
                  },
                  child: Text("Back In Town",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5)),
                margin: const EdgeInsets.fromLTRB(100, 20, 5, 10),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return signupPage();
                    }));
                  },
                  child: Text(
                    "New Here",
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
              Container(
                height: 60,
                width: 350,
                margin: const EdgeInsets.fromLTRB(5, 20, 100, 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5)),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Use Facebook",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
              )
            ],
          ),
        ));
  }
}
