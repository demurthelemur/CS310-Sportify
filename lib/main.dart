import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCA3eqqRrBTYtUQbqGzO9nUy-DHw53KqEs",
      appId: "1:773915627934:ios:27a081f21879105d3f068f",
      messagingSenderId: "773915627934",
      projectId: "sport-6f516",
    ),
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyFirebaseApp(),
  ));
}

class MyFirebaseApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen(message: snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const WelcomePage();
        }
        return const WaitingScreen();
      },
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPORTIFY'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sportify',
        home: Builder(builder: (BuildContext context) {
          return CircularProgressIndicator();
        }));
  }
}
