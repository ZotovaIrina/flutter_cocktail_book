import 'package:cocktail_book/api/api_ingredients.dart';

class Ingredient {
  String name = '';
  String? description;

  Ingredient(this.name, this.description);

  Map<String, String?> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      Ingredient(json["name"], json["description"]);

  save() {
    createIngredient(toJson());
  }
}
