import 'package:flutter/material.dart';
import 'package:intro_app/screens/info_screen.dart';
import 'package:intro_app/screens/loading_screen.dart';
import 'package:intro_app/screens/output_screen.dart';
import 'package:provider/provider.dart';
import 'models/personData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonData(),
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context) => LoadingScreen(),
          "/info_screen": (context) => InfoScreen(),
          "/output_screen": (context) => OutputScreen(),
        },
      ),
    );
  }
}
