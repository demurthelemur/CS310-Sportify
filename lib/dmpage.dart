import 'package:flutter/material.dart';
import 'objects/post.dart';
import 'objects/dm_card.dart';
import 'objects/styles.dart';

class dm_page extends StatelessWidget {
  final List<Profile> profiles;
  dm_page({Key? key, required this.profiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel),
          )
        ],
        elevation: 0.0,
        title: const Text(
          'Direct Messages',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appbar,
      ),
      body: Column(children: [
        SingleChildScrollView(
          child: Column(
            children: profiles
                .map((profile) => dm_card(
                      profile: profile,
                    ))
                .toList(),
          ),
        ),
      ]),
    );
  }
}
