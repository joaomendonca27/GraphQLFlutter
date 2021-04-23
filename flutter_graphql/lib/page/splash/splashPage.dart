import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () =>  Modular.to.popAndPushNamed(Modular.initialRoute + "home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("images/logoGit.png"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 45),
            child: Text("A Github App",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600),),
          ),
        ],
      ),
    );
  }
}