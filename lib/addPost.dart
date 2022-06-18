import 'package:flutter/material.dart';
import 'objects/styles.dart';
import './homefeed.dart';
import './notification.dart';
import './searchpage.dart';
import './profilepage.dart';
import 'objects/post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import './addphoto.dart';

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

  int postCount = 0;
  int _selectedIndex = 2;

  static List<Widget> _pages = [
    HomePage(),
    searchpage(),
    HomeView(),
    NotificationPage(),
    ProfilePage(profile: egefitness),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return _pages.elementAt(_selectedIndex);
      }));
    });
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
          backgroundColor: Color.fromARGB(255, 129, 189, 238),
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
                  fillColor: Color.fromARGB(255, 129, 189, 238),
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
                  fillColor: Color.fromARGB(255, 129, 189, 238),
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
              color: Color.fromARGB(255, 129, 189, 238),
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
              color: Color.fromARGB(255, 129, 189, 238),
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 3),
              child: (TextButton(
                child: Text("Add photo"),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddPhoto();
                  }));
                },
              )),
            ),
            Container(
              height: 70,
              width: 250,
              color: Color.fromARGB(255, 129, 189, 238),
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
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          fixedColor: AppColors.appbar,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_rounded),
              label: 'Add Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
        ));
  }
}
