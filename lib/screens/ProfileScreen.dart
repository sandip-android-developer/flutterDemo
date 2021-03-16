import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/profile/CardView.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  File _image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints.tight(Size(double.infinity, 140.0)),
              //  padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 40.0),
              child: Stack(alignment: Alignment.center, children: [
                new CircleAvatar(
                  radius: 140.0,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage('assets/images/profile_scott.png'),
                ),
                new GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xffFDCF09),
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              _image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  CardView(
                    text: "My account",
                    textColor: Colors.black,
                    color: Colors.grey[50],
                    icons: Icons.person_outline,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CardView(
                    text: "Notifications",
                    textColor: Colors.black,
                    color: Colors.grey[50],
                    icons: Icons.notifications_none,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CardView(
                    text: "Setting ",
                    textColor: Colors.black,
                    color: Colors.grey[50],
                    icons: Icons.settings_outlined,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CardView(
                    text: "Help Center",
                    textColor: Colors.black,
                    color: Colors.grey[50],
                    icons: Icons.help_center_outlined,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CardView(
                    text: "About",
                    textColor: Colors.black,
                    color: Colors.grey[50],
                    icons: Icons.ac_unit_sharp,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CardView(
                    text: "Logout",
                    textColor: Colors.black,
                    color: Colors.grey[50],
                    icons: Icons.logout,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _impFromGallary();
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imageFromcamera();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  _impFromGallary() async {
    PickedFile image =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      if (_image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _imageFromcamera() async {
    PickedFile image =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      if (_image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
