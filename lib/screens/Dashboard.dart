import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/HomeScreen.dart';
import 'package:flutter_app/screens/MessageScreen.dart';
import 'package:flutter_app/screens/ProfileScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  ListQueue<int> _navigationQueue = ListQueue();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_index == 0) return true;
        setState(() {
          _index = 0;
        });
        return false;
        /* if (_navigationQueue.isEmpty)
        return true;
      setState(() {
        _index = _navigationQueue.last;
        _navigationQueue.removeLast();
      });
      return false;*/
      },
      child: Scaffold(
        /*appBar: AppBar(
        title: Text('Dashboard'),
      ),*/
        body: (_getBody(_index)),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            //_navigationQueue.addLast(_index);
            setState(() => _index = value);
            print(value);
          },
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profle')
          ],
        ),
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return HomeScreen(); // Create this function, it should return your first page as a widget
      case 1:
        return MessageScreen(); // Create this function, it should return your second page as a widget
      case 2:
        return ProfileScreen(); // Create this function, it should return your third page as a widget
    }
  }
}
