import 'package:flutter/material.dart';
import 'package:intro_app/constants.dart';
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
      backgroundColor: Colors.purpleAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                name = value;
              },
              decoration: kNameInputDecorator,
            ),
            RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Male",
                style: TextStyle(color: Colors.white),
              ),
              value: "Male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            RadioListTile(
              activeColor: Colors.orange,
              title: Text(
                "Female",
                style: TextStyle(color: Colors.white),
              ),
              value: "Female",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value;
                });
              },
            ),
            SizedBox(height: 20),
            CustomElevation(
              height: 50,
              child: FlatButton(
                onPressed: () {
                  if (name != null && gender != null) {
                    Provider.of<PersonData>(context, listen: false)
                        .addName(name);
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                    color: Colors.white,
                    //fontSize: 18,
                  ),
                ),
                color: Colors.orange[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevation extends StatelessWidget {
  final Widget child;
  final double height;

  CustomElevation({@required this.child, @required this.height})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(this.height / 2)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.yellow,
            blurRadius: height / 2,
            offset: Offset(0, height / 5),
          ),
        ],
      ),
      child: this.child,
    );
  }
}
