
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';


class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto > {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_image!.path);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads/$fileName');
    try {
      await firebaseStorageRef.putFile(File(_image!.path));
      print("Upload complete");
      setState(() {
        _image = null;
      });
    } on FirebaseException catch(e) {
      print('ERROR: ${e.code} - ${e.message}');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPORTIFY'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text('Connected to Firebase')
              ),
            ),

            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: _image != null
                        ? Image.file(File(_image!.path)) : TextButton(
                        child: Icon(
                          Icons.add_a_photo,
                          size: 150,
                        ),
                        onPressed: pickImage,
                      )
                    ),
                  )
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(_image != null) OutlinedButton(
                  onPressed: (){
                    uploadImageToFirebase(context);
                  },
                  child: Text('Upload image'),
                ),

                SizedBox(width: 16,),

                if(_image != null) OutlinedButton(
                  onPressed: (){
                    setState(() {
                      _image = null;
                    });
                  },
                  child: Text('Cancel'),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
