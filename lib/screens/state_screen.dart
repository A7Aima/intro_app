import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intro_app/screens/city_screen.dart';

class StateScreenList extends StatefulWidget {
  final String name;
  final String gender;
  StateScreenList({this.name, this.gender});
  @override
  _StateScreenListState createState() => _StateScreenListState();
}

class _StateScreenListState extends State<StateScreenList> {
  List<String> states = [];
  var _data;

  void getData() async {
    http.Response response =
        await http.get('http://api.minebrat.com/api/v1/states');
    _data = jsonDecode(response.body);
    print("${_data.length}");
    for (var state in _data) {
      states.add(state['stateName']);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Select State'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: states.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(states[index]),
            onTap: () {
              if (_data[index]['stateId'] != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CityScreenList(
                      name: widget.name,
                      gender: widget.gender,
                      state: states[index],
                      stateId: _data[index]['stateId'],
                    ),
                  ),
                );
              }
              //print(_data[index]['stateId']);
            },
          );
        },
      ),
    );
  }
}
