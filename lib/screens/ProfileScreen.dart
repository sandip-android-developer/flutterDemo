import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/profile/CardView.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
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
              child: Stack(
                  alignment: Alignment.center,
                  children: [
                new CircleAvatar(
                  radius: 140.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/profile_scott.png'),
                  ),
                new CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12.0,
                  child: Icon(
                    Icons.camera_alt,
                    size: 15.0,
                    color: Color(0xFF404040),
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
}
