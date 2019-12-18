import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, null);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Image.asset('images/logo.png'),
              SizedBox(
                height: 25,
              ),
              Text('Jatis Trans',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
