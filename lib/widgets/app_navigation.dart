import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton.icon(
            icon: Icon(Icons.home),
            label: Text('Home'),
            onPressed: () => context.go('/'),
          ),
          ElevatedButton.icon(
              icon: Icon(Icons.favorite),
              label: Text('Favorite'),
              onPressed: () => context.go('/likedWords')),
        ],
      ),
    );
  }
}
