import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationInfo {
  Future getStateData() async {
    http.Response response =
        await http.get('http://api.minebrat.com/api/v1/states');
    var _data = jsonDecode(response.body);
    print("${_data.length}");
    return _data;
  }

  Future getCityData(String stateId) async {
    http.Response response =
        await http.get('http://api.minebrat.com/api/v1/states/cities/$stateId');
    var _data = jsonDecode(response.body);
    print("${_data.length}");
    return _data;
  }
}
