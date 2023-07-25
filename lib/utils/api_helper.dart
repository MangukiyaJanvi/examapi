import 'dart:convert';

import 'package:examapi/screen/homescreen/model/home_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static final apihelper = ApiHelper._();

  ApiHelper._();

  Future<List<Homemodel>> getApi() async {
    String link =
        "https://api.unsplash.com/collections/?client_id=xiJ98BEONncLgJpnP5-Iwqt7bqt3bFHEPD3UpSf0CL4";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    print(json);
    List<Homemodel> list =
        List<Homemodel>.from(json.map((json) => Homemodel.fromJson(json)));
    // print(list);
    return list;
  }
}
