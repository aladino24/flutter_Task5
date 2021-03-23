import 'dart:async';
import 'package:flutter/material.dart';

import 'package:apedolan/login.dart';


class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

void initState(){
  super.initState();
  splashscreenStart();

}
splashscreenStart() async{
  var duration = const Duration(seconds: 3);
  return Timer(duration, (){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
   } 
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[200],
        body: Center(
          child: new Image.asset('images/apedolan.png'),
        ),
      ),
    );
  }
}