import 'package:cocktail_book/api/ingredients.dart';

class Ingridient {
  String name = '';
  String? description;

  Ingridient(this.name, this.description);
  Map<String, String?> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }

  save() {
    createIngredient(toJson());
  }
}
