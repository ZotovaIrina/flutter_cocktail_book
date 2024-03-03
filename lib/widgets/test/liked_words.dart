import 'package:cocktail_book/state/my_app_state.dart';
import 'package:cocktail_book/widgets/app_page_wrapper.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikedWords extends StatelessWidget {
  const LikedWords({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var words = appState.favorites;
    return AppPageWrapper(
        page: SafeArea(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('You have ${words.length} favorites!',
              style: Theme.of(context).textTheme.headlineMedium),
          Expanded(child: ListOfWords(words: words))
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
