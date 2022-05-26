import 'package:flutter/material.dart';
import 'objects/styles.dart';
import './homefeed.dart';
class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 40, 12, 12),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'Write your existing password!',
              border: OutlineInputBorder(),
            )),
          ),
          Padding(
            padding: Dimensions.rPadding,
            child: TextField(
            decoration: InputDecoration(
                hintText: 'Write your new password!',
                border: OutlineInputBorder()),
          ),),
          Padding(
            padding: Dimensions.rPadding,
            child: TextField(
            decoration: InputDecoration(
                hintText: 'Write your new password again!',
                border: OutlineInputBorder()),
          ),),
          ElevatedButton(
                child: Text(
                  "     Done      ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.appbar),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColors.appbar)))),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));},
              ),
        ],
      ),
    );
  }
}
class EditUserNamePage extends StatelessWidget {
  const EditUserNamePage({Key? key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 40, 12, 12),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'Write your password!',
              border: OutlineInputBorder(),
            )),
          ),
          Padding(
            padding: Dimensions.rPadding,
            child: TextField(
            decoration: InputDecoration(
                hintText: 'Write your new username!',
                border: OutlineInputBorder()),
          ),),
          
          ElevatedButton(
                child: Text(
                  "     Done      ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.appbar),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: AppColors.appbar)))),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));},
              ),
        ],
      ),
    );
  }
}
