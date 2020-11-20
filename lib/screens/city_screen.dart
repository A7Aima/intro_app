import 'package:flutter/material.dart';
import 'package:intro_app/constants.dart';
import 'package:intro_app/models/personData.dart';
import 'package:intro_app/screens/output_screen.dart';
import 'package:intro_app/services/location.dart';
import 'package:provider/provider.dart';

class CityScreenList extends StatefulWidget {
  final String stateId;
  CityScreenList({this.stateId});
  @override
  _CityScreenListState createState() => _CityScreenListState();
}

class _CityScreenListState extends State<CityScreenList> {
  List<String> cities = [];
  List<String> searchedCities = [];
  var _data;
  bool _search = false;

  void getData() async {
    _data = await LocationInfo().getCityData(widget.stateId);
    for (var city in _data) {
      cities.add(city['cityName']);
    }
    searchedCities = cities;
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
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        shadowColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _search = !_search;
              });
            },
            icon: _search ? Icon(Icons.clear) : Icon(Icons.search),
          )
        ],
        title: _search ? buildSearchButton() : Text('Select City'),
        centerTitle: true,
      ),
      body: cities.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: searchedCities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    searchedCities[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Provider.of<PersonData>(context, listen: false)
                        .addCity(searchedCities[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OutputScreen(),
                      ),
                    );
                    // print(_data[index]['stateId']);
                  },
                );
              },
            ),
    );
  }

  TextField buildSearchButton() {
    return TextField(
      decoration: kSearchInputDecoration,
      onChanged: (value) {
        setState(() {
          searchedCities = cities
              .where((element) =>
                  element.toLowerCase().contains(value.toLowerCase()))
              .toList();
          if (value.isEmpty) {
            searchedCities = cities;
          }
        });
      },
    );
  }
}
