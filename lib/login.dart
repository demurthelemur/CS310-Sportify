import 'package:cs310/homefeed.dart';
import 'package:flutter/material.dart';
import 'objects/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

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
              ),
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
              ),
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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
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
