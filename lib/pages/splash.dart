import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isvisible = false;
  _SplashScreenState() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      });
    });
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        _isvisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 142, 197, 252),
            Color.fromARGB(255, 224, 195, 252)
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.mirror,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isvisible ? 1.0 : 0,
        duration: Duration(seconds: 2),
        child: Center(
          child: Container(
            height: 140,
            width: 140,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20.0,
                    offset: Offset(3.0, 3.0),
                    spreadRadius: 6.0),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.analytics,
                color: Colors.deepPurple,
                size: 95,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
