import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget{
  @override
 _MessageScreen createState() => _MessageScreen();

}

class _MessageScreen  extends State<MessageScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Message Screen"),),
    );
  }
}