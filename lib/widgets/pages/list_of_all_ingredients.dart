import 'package:cocktail_book/models/ingredient.dart';
import 'package:cocktail_book/state/ingredients_state.dart';
import 'package:cocktail_book/widgets/app_page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ListOfAllIngredients extends StatefulWidget {
  const ListOfAllIngredients({super.key});

  @override
  State<ListOfAllIngredients> createState() => _ListOfAllIngredientsState();
}

class _ListOfAllIngredientsState extends State<ListOfAllIngredients> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final ingredientsState =
          Provider.of<IngredientsState>(context, listen: false);
      ingredientsState.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var ingredients = context.watch<IngredientsState>();

    return AppPageWrapper(
        page: SafeArea(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Ingredients',
              style: Theme.of(context).textTheme.headlineMedium),
          Expanded(
              child: ListOfIngredientsWidget(
                  ingredients: ingredients.listOfAllIngredients))
        ]),
      ),
    ));
  }
}

class ListOfIngredientsWidget extends StatelessWidget {
  const ListOfIngredientsWidget({
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
