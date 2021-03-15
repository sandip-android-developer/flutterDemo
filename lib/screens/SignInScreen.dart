import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/components/RoundButton.dart';
import 'package:flutter_app/model/ReponsePOJO/LoginResponse.dart';
import 'package:flutter_app/screens/ForgotPassword.dart';
import 'package:flutter_app/screens/SignUpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  SignIn createState() => SignIn();
}

class SignIn extends State<SignInScreen> {
  bool is_loading = false;
  Future<LoginResponse> loginResponse;

  /*@override
  void initState() {
    super.initState();
    loginResponse = getLoginData();
  }*/

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool is_loading = false;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Login demo")),
      body: SingleChildScrollView(
        child: (loginResponse == null)
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                    child: TextFormField(
                      controller: emailController,
                      validator: _EmailValidator,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide(width: 1 /*,color: Colors.red*/)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(width: 1 /*, color: Colors.red*/),
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
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: _PassWordValidator,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide(width: 1 /*,color: Colors.red*/)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                BorderSide(width: 1 /*, color: Colors.red*/),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text(
                      'Forgot password',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  /*  Container(
              child: FutureBuilder<LoginResponse>(
                future: loginResponse,
                builder: (context,snapshot){
                  if(snapshot.hasData)
                    {

                    }
                },


              ),
            )*/
                  RoundButton(
                      text: "Login",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Dashboard()));
                        /*setState(() {
                          loginResponse = getLoginData();
                        });*/
                        /* showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(child: CircularProgressIndicator(),);
                      });*/
                        /*  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));*/
                      }),
                  /* Container(
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
            ),*/
                  SizedBox(
                    height: 130,
                  ),
                  GestureDetector(
                    onTap: () {
                      /* Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));*/
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text.rich(TextSpan(text: 'New User?', children: [
                      TextSpan(
                          text: 'SignUp', style: TextStyle(color: Colors.red)),
                    ])),
                  )
                ],
              )
            : FutureBuilder<LoginResponse>(
                future: loginResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //  SharedPreferences sharedPreferences= SharedPreferences.getInstance();
                    // return Text(snapshot.data.responseData.single.firstName);
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      // Do everything you want here...
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    });

                    /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard()));*/
                  } else if (snapshot.hasError) {
                    print("Something Went Wrong");
                    return Text("${snapshot.error}");
                  }
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(top: 20.0),
                      child: CircularProgressIndicator(),)
                    ],
                  );
                },
              ),
      ),
    );
  }

  String _PassWordValidator(String value) {
    if (value.isEmpty)
      return "Field Can't be Emplty";
    else if (value.length < 6) return "Password must be 6 character long";
    return null;
  }

  String _EmailValidator(String value) {
    try {
      if (value.isEmpty) return "Filed can't be empty";
    } catch (e) {}
    return null;
  }

  Future<LoginResponse> getLoginData() async {
    print("response-data--comming--");
    // or new Dio with a BaseOptions instance.

/* BaseOptions options = new BaseOptions(
    baseUrl: "https://www.xx.com/api",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );*/

    BaseOptions options = new BaseOptions(
      baseUrl: "http://10.0.2.2:8000",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);
    var formData = {"email": "s1@gmail.com", "password": "123456"};

    //  var jsonData=null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Response response =
        await dio.post("/api/login", data: FormData.fromMap(formData));
    print("response-data--" + response.statusCode.toString());
    if (response.statusCode == 200) {
      //  var jsonData = LoginResponse.fromJson(response.data).responseData;
      return LoginResponse.fromJson(response.data);
      /*  setState(() {
        is_loading=false;
       // sharedPreferences.setString("token", jsonData;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Dashboard()));
      });*/
      // print("response-data--" + data);
    } else {
      throw Exception('Failed to login');
    }
    print("response-data--" + response.data.toString());
  }
}
