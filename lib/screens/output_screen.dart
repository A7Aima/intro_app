import 'package:flutter/material.dart';
import 'package:intro_app/constants.dart';
import 'package:intro_app/screens/info_screen.dart';

class OutputScreen extends StatelessWidget {
  final String name;
  final String gender;
  final String city;
  final String state;
  OutputScreen({this.name, this.gender, this.city, this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app_rounded),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfoScreen(),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              " Dear ${gender == 'Male' ? "Mr" : "Ms"} $name",
              style: kNameText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'you are from',
              textAlign: TextAlign.center,
              style: kIntroText,
            ),
            SizedBox(height: 20),
            Text(
              "${city.toUpperCase()}",
              style: kCityText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "in",
              textAlign: TextAlign.center,
              style: kIntroText,
            ),
            SizedBox(height: 20),
            Text(
              '${state.toUpperCase()}',
              textAlign: TextAlign.center,
              style: kStateText,
            ),
            SizedBox(height: 20),
            Text(
              "INDIA",
              textAlign: TextAlign.center,
              style: kIndiaText,
            ),
          ],
        ),
      ),
    );
  }
}
