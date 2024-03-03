import 'dart:convert';
import 'package:coctail_book/api/api_conts.dart';
import 'package:http/http.dart' as http;

Future<http.Response> createIngredient(Map<String, String?> ingredient) {
  return http.post(
    Uri.parse('$baseUrlServer/ingredients'),
    headers: baseHeader,
    body: jsonEncode(ingredient),
  );
}
