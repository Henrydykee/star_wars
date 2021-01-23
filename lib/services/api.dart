import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_wars/model/stars_wars_model.dart';

class Api {
  static const BASE_URL = "https://swapi.dev/api";


  Future<List<StarWars>> getPeople(int page) async {
    List <StarWars> starWars = [];
    try {
      var url = "$BASE_URL/people/?page=$page";
      Map<String, String> headers = {'Content-Type': 'application/json'};
      await http.get(url, headers: headers).then((response) {
        if (response.statusCode == 200) {
          Map<String, dynamic> _decodedMap = json.decode(response.body);
          _decodedMap['results'].forEach((e) {
            starWars.add(StarWars.fromJson(e));
          });
          // starWars = StarWars.fromJson(_decodedMap['results']);
        }
      });
    } catch (e) {
      throw Error(message: e.message);
    }
    return starWars;
  }
}

class Error{
 final String message;
 Error({this.message});

}