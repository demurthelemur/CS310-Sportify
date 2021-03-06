import 'package:cs310/welcome.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'objects/styles.dart';
import './edit.dart';
import 'objects/auth.dart';

class Settin extends StatefulWidget {
  const Settin({Key? key}) : super(key: key);

  @override
  State<Settin> createState() => _SettinState();
}

class _SettinState extends State<Settin> {
  void buttonPressed() {
    print('Button Pressed in Function');
  }

  final AuthService _auth = AuthService();

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: 350,
              margin: Dimensions.pPadding,
              child: (ElevatedButton(
                child: Text(
                  "Change password",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.settings),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColors.settings)))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditPasswordPage();
                  }));
                },
              )),
            ),
            Container(
              height: 70,
              width: 350,
              margin: Dimensions.pPadding,
              child: (ElevatedButton(
                child: Text(
                  "Change username",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.settings),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColors.settings)))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditUserNamePage();
                  }));
                },
              )),
            ),
            Container(
              height: 70,
              width: 350,
              margin: Dimensions.pPadding,
              child: (ElevatedButton(
                child: Text(
                  "Make Your Account Private",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.settings),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColors.settings)))),
                onPressed: () {},
              )),
            ),
            ToggleSwitch(
              customWidths: [90.0, 50.0],
              cornerRadius: 20.0,
              activeBgColors: [
                [Colors.cyan],
                [Colors.redAccent]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ['YES', 'NO'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            Container(
              height: 70,
              width: 350,
              margin: Dimensions.pPadding,
              child: (ElevatedButton(
                child: Text(
                  "Saved Pictures",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.settings),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColors.settings)))),
                onPressed: () {},
              )),
            ),
            Container(
              height: 70,
              width: 350,
              margin: Dimensions.pPadding,
              child: (ElevatedButton(
                child: Text(
                  "Log-out",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.settings),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColors.settings)))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    _auth.signOut();
                    return WelcomePage();
                  }));
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
