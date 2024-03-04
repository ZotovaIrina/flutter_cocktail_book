import 'package:cocktail_book/api/api_ingredients.dart';
import 'package:cocktail_book/widgets/ingredients/Ingredient.dart';
import 'package:flutter/material.dart';

class IngredientsState extends ChangeNotifier {
  var listOfAllIngredients = <Ingredient>[];

  Future fetchData() async {
    // if (listOfAllIngredients.isEmpty) {
    final response = await getAllIngredients();
    print('!!!!!!!!! $response');
    // }
  }
}

// Future<String> fetchData() async {
//  if(value==null){
//  try {
//   final response =
//       await http.get(url, headers: {'Authorization': 'Bearer $_token'});......
//  value=(YourReturnedString)
//   }
//  }
//   return value;
//  }
