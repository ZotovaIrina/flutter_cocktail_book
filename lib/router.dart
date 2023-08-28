import 'package:coctail_book/widgets/test/generator_page.dart';
import 'package:coctail_book/widgets/test/liked_words.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          path: 'likedWords',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: LikedWords(),
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
      ],
    ),
  ],
);
