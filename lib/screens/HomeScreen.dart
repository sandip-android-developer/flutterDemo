import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
    _Home createState()=> _Home();

}

class _Home  extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
    );
  }
}