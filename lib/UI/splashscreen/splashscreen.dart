import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onlinegym/UI/dashboard/home.dart';
import 'package:onlinegym/UI/login/userLogin.dart';
import 'package:onlinegym/widgets/imageWidget.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => UserLogin()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ImageWithAsset(path: 'images/gymlogo.png',height: 100,width: 100,),
      ),
    );
  }
}
