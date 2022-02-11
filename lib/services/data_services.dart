import 'dart:convert';

import 'package:flutter_cubit/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces'; // api endpoint

    // http get request
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    // parsing with helper function, it creates a request to the server and then returns smth (http.Response)
    // we use await (async) because we want the app to continue working until we get our response back

    // making sure that we do get a response back from the server
    try {
      if (res.statusCode == 200) {
        // once we get the data, we need to decode it
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList(); // just some black magic :)
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
