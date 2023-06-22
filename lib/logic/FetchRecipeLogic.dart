import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipie_saver_flutter/logic/RecipeModel.dart';

Future<Recipes> fetchFood(Recipes recipes, String q) async {
  print("Getting data");
  String url = 'https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&q=$q';
  Map<String, String> header = <String, String>{
    "X-RapidAPI-Key": "2d2eafbf49mshe67dc8b081eb73fp19a7a2jsn62fcea55d7d4",
    "X-RapidAPI-Host": "tasty.p.rapidapi.com"
  };
  final uri = Uri.parse(url);
  final response = await http.get(uri, headers: header);
  final body = response.body;
  final json = jsonDecode(body);
  recipes = Recipes.fromJson(json);
  print(recipes);
  return Future.value(recipes);
}
