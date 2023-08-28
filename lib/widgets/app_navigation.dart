import 'package:coctail_book/widgets/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      right: false,
      left: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 35),
        child: Flex(
          direction: getSize(context) == ScreenSize.mobile
              ? Axis.vertical
              : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }
}
