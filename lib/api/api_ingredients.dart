import 'dart:convert';
import 'package:cocktail_book/api/api_conts.dart';
import 'package:cocktail_book/models/ingredient.dart';
import 'package:http/http.dart' as http;

Future<http.Response> createIngredient(Map<String, String?> ingredient) {
  return http.post(
    Uri.parse('$baseUrlServer/ingredients'),
    headers: baseHeader,
    body: jsonEncode(ingredient),
  );
}

Future<List<Ingredient>> getAllIngredients() async {
  final res = await http.get(
      Uri.parse('$baseUrlServer/ingredients/getAllIngredients'),
      headers: baseHeader);
  final responseJson = json.decode(res.body);

  if (res.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return List<Ingredient>.from(
        responseJson.map((x) => Ingredient.fromJson(x)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ingredients');
  }
}
