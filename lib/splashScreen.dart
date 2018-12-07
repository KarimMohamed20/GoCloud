import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gocloud/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () {Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyHomePage()));});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset('assets/logo.png',
          width: 150,
          height: 150,),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background.png'),
            fit: BoxFit.fill)),
      ),
    );
  }
}
