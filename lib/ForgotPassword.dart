import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:60.0),
              child: Center(
                child: Container(
                  height: 120,
                  child: Image.asset('assets/images/flutter-logo.png'),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(width: 1)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(width: 1)),
                labelText: 'Email',
                hintText: 'Enter Email',
                labelStyle: TextStyle(color: Colors.black54)
              ),
            ),),
            Container(
              height: 50,
              width: width*2/3,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0)
              ) ,
              child: FlatButton(onPressed:() {},
              child: Text('Send',
              style: TextStyle(color: Colors.white,fontSize: 20.0),),),
            )

          ],
        ),
      ),
    );
  }
}
