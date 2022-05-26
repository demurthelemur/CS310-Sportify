import 'package:flutter/material.dart';
import 'homefeed.dart';
import './searchpage.dart';
import './addPost.dart';
import './profilepage.dart';
import 'objects/post.dart';
import 'objects/styles.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int postCount = 0;
  int _selectedIndex = 3;

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
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {},
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
                child: Column(
          children: [
            SingleNotification(
                "New Message", "new message from Serra Sadir", "image", 1),
            SingleNotification(
                "New Follower", "Demir Dereli just followed you", "image", 1),
            SingleNotification(
                "New Like", "Ceren Dinc Liked your Photo", "image", 1),
            SingleNotification(
                "New Followerr", "Zeynep Güçlü just followed you", "image", 1),
            SingleNotification(
                "New Message", "new message from DemurTheLemur", "image", 1),
            SingleNotification(
                "New Message", "new message from Emre Sener", "image", 1),
            SingleNotification("Follow Request",
                "Serra Sadir Accepted your follow request", "image", 1),
            SingleNotification(
                "New Message", "new message from Serra Sadir", "image", 1)
          ],
        ))),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          fixedColor: Colors.red,
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

class SingleNotification extends StatelessWidget {
  final String title;
  final String message;
  final String image;
  final int notificationID;

  const SingleNotification(
      this.title, this.message, this.image, this.notificationID,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.fromLTRB(3, 10, 3, 10),
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            margin: const EdgeInsets.fromLTRB(7, 10, 5, 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 10, 10),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
