import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intro_app/screens/output_screen.dart';

class CityScreenList extends StatefulWidget {
  final String state;
  final String stateId;
  final String name;
  final String gender;
  CityScreenList({this.gender, this.name, this.state, this.stateId});
  @override
  _CityScreenListState createState() => _CityScreenListState();
}

class _CityScreenListState extends State<CityScreenList> {
  List<String> cities = [];

  var _data;

  void getData() async {
    http.Response response = await http
        .get('http://api.minebrat.com/api/v1/states/cities/${widget.stateId}');
    _data = jsonDecode(response.body);
    print("${_data.length}");
    for (var city in _data) {
      cities.add(city['cityName']);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Select City'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OutputScreen(
                    name: widget.name,
                    gender: widget.gender,
                    state: widget.state,
                    city: cities[index],
                  ),
                ),
              );
              // print(_data[index]['stateId']);
            },
          );
        },
      ),
    );
  }
}
