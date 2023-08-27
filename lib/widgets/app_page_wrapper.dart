import 'package:coctail_book/widgets/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPageWrapper extends StatelessWidget {
  const AppPageWrapper({
    super.key,
    required this.page,
  });

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        AppNavigation(),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ),
        ),
      ]),
    );
  }
}
