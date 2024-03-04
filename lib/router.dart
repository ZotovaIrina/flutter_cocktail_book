import 'package:cocktail_book/state/ingredients_state.dart';
import 'package:cocktail_book/widgets/pages/create_ingredient.dart';
import 'package:cocktail_book/widgets/pages/list_of_all_ingredients.dart';
import 'package:cocktail_book/widgets/test/generator_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: GeneratorPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'allIngredients',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: ChangeNotifierProvider(
                  create: (context) => IngredientsState(),
                  child: ListOfAllIngredients()),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Change the opacity of the screen using a Curve based on the the animation's
                // value
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: 'createIngredient',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: CreateIngredient(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
