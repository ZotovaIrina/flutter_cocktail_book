import 'package:coctail_book/widgets/test/generator_page.dart';
import 'package:coctail_book/widgets/test/liked_words.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const GeneratorPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'likedWords',
          builder: (BuildContext context, GoRouterState state) {
            return const LikedWords();
          },
        ),
      ],
    ),
  ],
);
