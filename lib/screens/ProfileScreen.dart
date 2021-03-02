import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreen createState()=>_ProfileScreen();

}

class _ProfileScreen extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Profile Screen"),),
  );
  }
}