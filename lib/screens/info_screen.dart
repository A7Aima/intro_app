import 'package:flutter/material.dart';
import 'package:intro_app/screens/state_screen.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String gender;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(hintText: "Enter your Name"),
            ),
            RadioListTile(
              title: Text("Male"),
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            RadioListTile(
              title: Text("Female"),
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                if (name != null && gender != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateScreenList(
                        name: name,
                        gender: gender,
                      ),
                    ),
                  );
                }
              },
              child: Text("Submit"),
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
