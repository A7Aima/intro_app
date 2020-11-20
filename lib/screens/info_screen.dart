import 'package:flutter/material.dart';
import 'package:intro_app/models/personData.dart';
import 'package:intro_app/screens/state_screen.dart';
import 'package:provider/provider.dart';

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
                  Provider.of<PersonData>(context, listen: false).addName(name);
                  Provider.of<PersonData>(context, listen: false)
                      .addGender(gender);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StateScreenList(),
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
