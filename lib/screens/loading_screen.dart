import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intro_app/screens/info_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        backgroundColor: Colors.purpleAccent,
        seconds: 5,
        navigateAfterSeconds: InfoScreen(),
        title: Text(
          "LOADING...",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        loaderColor: Colors.white,
      ),
    );
  }
}
