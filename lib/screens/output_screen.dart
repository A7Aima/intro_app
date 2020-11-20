import 'package:flutter/material.dart';
import 'package:intro_app/constants.dart';
import 'package:intro_app/models/personData.dart';
import 'package:provider/provider.dart';

class OutputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PersonData>(
      builder: (context, personData, child) {
        return Scaffold(
          backgroundColor: Colors.purpleAccent,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.exit_to_app_rounded),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/info_screen',
                ModalRoute.withName("/output_screen"),
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
                  " Dear ${personData.gender == 'Male' ? "Mr" : "Ms"} ${personData.name}",
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
                  "${personData.city.toUpperCase()}",
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
                  '${personData.state.toUpperCase()}',
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
      },
    );
  }
}
