import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../consts.dart';
import '../models/actors_model.dart';

class ApiHttp {

  List<ActorsModel> actorsList = [];

  static Future getActors() async {
    var respond = http.get(Uri.parse(baseApi));
    return respond;
  }

  static Future<List<ActorsModel>> fetchDataActors() async {
    // List<ActorsModel> actorsList=[];
    var response = await http.get(Uri.parse(baseApi));

    if (response.statusCode == 200) {
      // print(response.body);
      Iterable list = json.decode(response.body);
      return list.map((model) => ActorsModel.fromJson(model)).toList();
    } else {
      throw Exception("Error ::: ");
    }
  }

 static Future createApi(String nameApi)async{
   String baseurl="https://freetestapi.com/api/v1/";
    var response = await http.post(Uri.parse("$baseurl$nameApi"),
     headers: {
      'Content-Type':'application/json;charset=UTF-8',
     },
    body: jsonEncode({

    })
    );



 }



}
