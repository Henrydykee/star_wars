

import 'dart:convert';
import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:star_wars/model/stars_wars_model.dart';
import 'package:star_wars/services/api.dart';

class StarWarsViewModel extends FutureViewModel{


  List <StarWars> _list = [];
  List <StarWars> get list => _list;

  var _api = Api();
  //StarWars starWars;
  var _people;
  List <StarWars> getPeople() => _people;


  // ignore: missing_return
  Future<void> getStarWarsPeople(int page) {
    try{
      _api.getPeople(page).then((e) async {
        _list = [...e];
        notifyListeners();
        if(_list.length < 20 ){
          var newList = await _api.getPeople(page++);
          _list.addAll(newList);
          notifyListeners();
        }
      });
    }catch(e){
      if(e is Error){
        print(e.message);
      }
    }
  }

  @override
  Future<void> futureToRun() async {
   return await getStarWarsPeople(2);

  }

}