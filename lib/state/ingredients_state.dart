import 'package:cocktail_book/api/api_ingredients.dart';
import 'package:cocktail_book/widgets/ingredients/Ingredient.dart';
import 'package:flutter/material.dart';

class IngredientsState extends ChangeNotifier {
  // List<Ingredient> listOfAllIngredients = [Ingredient('name1', 'description')];
  var listOfAllIngredients = <Ingredient>[];

  Future fetchData() async {
    if (listOfAllIngredients.isEmpty) {
      final response = await getAllIngredients();
      listOfAllIngredients.addAll(List<Ingredient>.from(response));
      notifyListeners();
    }
  }
}
