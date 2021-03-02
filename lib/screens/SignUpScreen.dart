import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUp createState() => new _SignUp();
}

class _SignUp extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController mobileController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Sign Up')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  height: 100,
                  child: Image.asset('assets/images/flutter-logo.png'),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              new Flexible(
                flex: 1,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 10.0, bottom: 5.0),
                  child: new TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(width: 1)),
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.black54),
                        hintText: 'Enter First Name Here'),
                  ),
                ),
              ),
              new Flexible(
                flex: 1,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10.0, right: 20.0, bottom: 5.0),
                  child: TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(width: 1)),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.black54),
                        hintText: 'Enter Last Name here'),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: 1)),
                    labelText: 'Email Id',
                    labelStyle: TextStyle(color: Colors.black54),
                    hintText: 'Enter email id '),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: TextField(
                controller: mobileController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: 1)),
                    labelText: 'Mobile No.',
                    labelStyle: TextStyle(color: Colors.black54),
                    hintText: 'Enter Mobile No.'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(width: 1)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black54),
                    hintText: 'Enter Password'),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0)),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text.rich(TextSpan(
                  text: 'Already registered?',
                  style: TextStyle(fontSize: 16.0),
                  children: [
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(color: Colors.red, fontSize: 18.0))
                  ])),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
