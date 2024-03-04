import 'package:cocktail_book/state/ingredients_state.dart';
import 'package:cocktail_book/widgets/app_page_wrapper.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOfAllIngredients extends StatelessWidget {
  const ListOfAllIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    var ingredients = context.watch<IngredientsState>();

    ingredients.fetchData();

    // var words = appState.favorites;
    return AppPageWrapper(
        page: SafeArea(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Ingredients',
              style: Theme.of(context).textTheme.headlineMedium),
          Expanded(child: Text('Content'))
        ]),
      ),
    ));
  }
}

class ListOfWords extends StatelessWidget {
  const ListOfWords({
    super.key,
    required this.words,
  });

  final List<WordPair> words;

  @override
  Widget build(BuildContext context) {
    if (words.isEmpty) {
      return Text('List is empty');
    } else {
      return ListView(
        children: words
            .map((e) => ListTile(
                  title: Text(e.asCamelCase),
                ))
            .toList(),
      );
    }
  }
}
