import 'package:coctail_book/widgets/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var route =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    // var theme = Theme.of(context);

    print(route);
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
            isActiveRouter(route, '/')
                ? ElevatedButton.icon(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    )),
                    onPressed: () => context.go('/'),
                  )
                : TextButton.icon(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    )),
                    onPressed: () => context.go('/'),
                  ),
            isActiveRouter(route, '/likedWords')
                ? ElevatedButton.icon(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorite'),
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    )),
                    onPressed: () => context.go('/likedWords'))
                : TextButton.icon(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorite'),
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    )),
                    onPressed: () => context.go('/likedWords')),
          ],
        ),
      ),
    );
  }
}

bool isActiveRouter(String currentPath, String path) {
  return currentPath == path;
}
