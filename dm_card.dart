// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import './post.dart';
import './dm_page.dart';

class dm_card extends StatelessWidget {
  final Profile profile;

  const dm_card({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      backgroundColor: Colors.pink,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(profile.pp),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      radius: 40,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        profile.username,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text('Message'),
                    ],
                  ),
                ],
              ),
              onTap: () => print('tapped dm'),
            ),
          ],
        ),
      ),
    );
  }
}
