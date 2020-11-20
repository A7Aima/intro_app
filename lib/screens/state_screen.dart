import 'package:flutter/material.dart';
import 'package:intro_app/constants.dart';
import 'package:intro_app/models/personData.dart';
import 'package:intro_app/screens/city_screen.dart';
import 'package:intro_app/services/location.dart';
import 'package:provider/provider.dart';

class StateScreenList extends StatefulWidget {
  final String name;
  final String gender;
  StateScreenList({this.name, this.gender});
  @override
  _StateScreenListState createState() => _StateScreenListState();
}

class _StateScreenListState extends State<StateScreenList> {
  List<String> states = [];
  List<String> searchStates = [];
  bool _search = false;
  var _data;

  void getData() async {
    _data = await LocationInfo().getStateData();
    for (var state in _data) {
      states.add(state['stateName']);
    }
    searchStates = states;
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
        title: _search ? buildSearchButton() : Text('Select State'),
        centerTitle: false,
      ),
      body: states.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: searchStates.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchStates[index]),
                  onTap: () {
                    int i = states.indexOf(searchStates[index]);
                    if (_data[i]['stateId'] != null) {
                      Provider.of<PersonData>(context, listen: false)
                          .addState(searchStates[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreenList(
                            stateId: _data[i]['stateId'],
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

  TextField buildSearchButton() {
    return TextField(
      decoration: kSearchInputDecoration,
      onChanged: (value) {
        setState(() {
          searchStates = states
              .where((element) =>
                  element.toLowerCase().contains(value.toLowerCase()))
              .toList();
          if (value.isEmpty) {
            searchStates = states;
          }
        });
      },
    );
  }
}

// color: Colors.blue,
// padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
