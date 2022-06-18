import 'package:flutter/material.dart';
import 'objects/styles.dart';
import 'login.dart';
import 'signup.dart';

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
          color: Color.fromARGB(212, 255, 255, 255),
          width: 1000,
          child: Column(
            children: [
              Container(
                margin: Dimensions.rPadding,
                child: Image.asset("assets/welcome.jpeg"),
              ),
              Container(
                height: 60,
                width: 350,
                margin: const EdgeInsets.fromLTRB(5, 20, 100, 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return loginPage();
                    }));
                  },
                  child: Text(
                    "Login",
                    style: welcomeText,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.appbar)),
                ),
              ),
              Container(
                height: 60,
                width: 350,
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
                          MaterialStateProperty.all<Color>(AppColors.appbar)),
                ),
              ),
              Container(
                height: 60,
                width: 350,
                margin: const EdgeInsets.fromLTRB(5, 20, 100, 10),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Use Facebook",
                    style: welcomeText,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.appbar)),
                ),
              )
            ],
          ),
        ));
  }
}
