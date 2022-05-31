import 'package:flutter/material.dart';
import 'objects/styles.dart';
import 'login.dart';
import 'signup.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'objects/auth.dart';




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
          backgroundColor: AppColors.appbar,
        ),
        body: Container(
          color: Colors.black,
          height: 1000,
          child: Column(
            children: [
              Container(
                margin: Dimensions.rPadding,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appbar, width: 10)),
                child: Image.asset("assets/welcome.jpeg"),
              ),
              Container(
                height: 60,
                width: 350,
                margin: const EdgeInsets.fromLTRB(5, 20, 100, 10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appbar, width: 5)),
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return loginPage();
                    }));
                  },
                  child: Text("Back In Town",
                      style: welcomeText,),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appbar, width: 5)),
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
                    style: welcomeText,
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
                    border: Border.all(color: AppColors.appbar, width: 5)),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Use Facebook",
                    style: welcomeText,
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
