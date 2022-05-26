import 'package:flutter/material.dart';
import 'objects/styles.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void buttonPressed() {
    print('Button Pressed in Function');
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(),
                hintText: "Add your caption",
              ),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(),
                hintText: "Add your text",
              ),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 70,
            width: 250,
            color: Colors.black,
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 3),
            child: (TextButton(
              child: Text("Add location"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20,
                ),
                primary: Colors.white,
              ),
              onPressed: () {},
            )),
          ),
          Container(
            height: 70,
            width: 250,
            color: Colors.black,
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 3),
            child: (TextButton(
              child: Text("Add photo"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20,
                ),
                primary: Colors.white,
              ),
              onPressed: () {},
            )),
          ),
          Container(
            height: 70,
            width: 250,
            color: Colors.black,
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 3),
            child: (TextButton(
              child: Text("Add video"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20,
                ),
                primary: Colors.white,
              ),
              onPressed: () {},
            )),
          ),
          Container(
            height: 70,
            width: 250,
            color: Colors.black,
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 3),
            child: (TextButton(
              child: Text("Add stats"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20,
                ),
                primary: Colors.white,
              ),
              onPressed: () {},
            )),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
