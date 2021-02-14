import 'package:flutter/material.dart';
import 'package:flutter_app/Dashboard.dart';
import 'package:flutter_app/SignUpScreen.dart';
import 'package:flutter_app/ForgotPassword.dart';

class SignInScreen extends StatefulWidget {
  @override
  SignIn createState() => SignIn();
}

class SignIn extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Login demo")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/flutter-logo.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(width: 1 /*,color: Colors.red*/)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 1 /*, color: Colors.red*/),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black54),
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            BorderSide(width: 1 /*,color: Colors.red*/)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(width: 1 /*, color: Colors.red*/),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black54),
                    hintText: 'Enter Password'),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
              },
              child: Text(
                'Forgot password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            GestureDetector(
              onTap: () {
                /* Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));*/
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text.rich(TextSpan(text: 'New User?', children: [
                TextSpan(text: 'SignUp', style: TextStyle(color: Colors.red)),
              ])),
            )
          ],
        ),
      ),
    );
  }
}
