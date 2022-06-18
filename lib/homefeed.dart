import 'package:cs310/dmpage.dart';
import 'package:flutter/material.dart';
import 'objects/post.dart';
import './addPost.dart';
import './searchpage.dart';
import './profilepage.dart';
import 'objects/homepost_card.dart';
import './notification.dart';
import 'objects/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int postCount = 0;
  int _selectedIndex = 0;

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

  void increamentLike(Post post) {
    setState(() {
      post.likes++;
    });
  }

  void buttonClicked() {
    setState(() {
      postCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return dm_page(profiles: profiles);
                }));
              },
              icon: const Icon(Icons.account_box),
            )
          ],
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
          child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      children: totalposts
                          .map((post) => HomePostCard(
                                post: post,
                                increament: () {
                                  increamentLike(post);
                                },
                              ))
                          .toList()))),
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
