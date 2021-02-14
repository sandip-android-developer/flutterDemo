
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  @override
  _Dashboard  createState()=> _Dashboard();

}

class _Dashboard  extends State<Dashboard>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Dashboard'),),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.red,
      currentIndex: 0,
      items: [BottomNavigationBarItem(icon: Icon(Icons.home),
      label:'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.mail),
            label:'Message'),
        BottomNavigationBarItem(icon: Icon(Icons.person),
            label:'Profle')],
    ),
    );
  }
}