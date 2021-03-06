import 'package:flutter/material.dart';
import 'objects/post.dart';
import 'objects/postcard.dart';
import './searchpage.dart';
import 'homefeed.dart';
import './notification.dart';
import './addPost.dart';
import './settings.dart';
import 'objects/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;
  ProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int postCount = 0;
  int _selectedIndex = 4;

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

  void deletePost(Post post) {
    setState(() {
      posts.remove(post);
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
                  return Settin();
                }));
              },
              icon: const Icon(Icons.settings),
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      widget.profile.username,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: CircleAvatar(
                            backgroundColor: Colors.pink,
                            child: ClipOval(
                              child: Image(
                                image: AssetImage(widget.profile.pp),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            radius: 60,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                              child: Text(
                                widget.profile.postcount.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const Text(
                              'Posts',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                              child: Text(
                                widget.profile.follower.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              'Follower',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                              child: Text(
                                widget.profile.following.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        
                      ],
                    ),
                    Column(
                      children: widget.profile.posts
                          .map((post) => PostCard(
                                post: post,
                                delete: () {
                                  deletePost(post);
                                },
                                increament: () {
                                  increamentLike(post);
                                },
                              ))
                          .toList(),
                    ),
                 
                  ],
                  
                ),
                
                ),
          ),
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
