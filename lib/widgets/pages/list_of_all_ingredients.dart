import 'package:cocktail_book/state/ingredients_state.dart';
import 'package:cocktail_book/widgets/app_page_wrapper.dart';
import 'package:cocktail_book/widgets/ingredients/Ingredient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOfAllIngredients extends StatelessWidget {
  const ListOfAllIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    var ingredientsState = context.watch<IngredientsState>();
    ingredientsState.fetchData();
    var listOfAllIngredients = ingredientsState.listOfAllIngredients;

    return AppPageWrapper(
        page: SafeArea(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Ingredients',
              style: Theme.of(context).textTheme.headlineMedium),
          Expanded(child: ListOfIngredients(ingredients: listOfAllIngredients))
        ]),
      ),
    ));
  }
}

class ListOfIngredients extends StatelessWidget {
  const ListOfIngredients({
    super.key,
    required this.ingredients,
  });

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return Text('List is empty');
    } else {
      return ListView(
        children: ingredients
            .map((e) => ListTile(
                  title: Text(e.name),
                ))
            .toList(),
      );
    }
  }
}
