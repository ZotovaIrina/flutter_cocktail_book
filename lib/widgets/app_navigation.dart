import 'package:coctail_book/widgets/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var route =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

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
            NavigationButton(
                buttonIcon: Icons.home,
                buttonText: 'Home',
                onButtonPress: () => context.go('/'),
                isActive: isActiveRouter(route, '/')),
            NavigationButton(
                buttonIcon: Icons.favorite,
                buttonText: 'Favorite',
                onButtonPress: () => context.go('/likedWords'),
                isActive: isActiveRouter(route, '/likedWords')),
          ],
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.buttonIcon,
    required this.buttonText,
    required this.isActive,
    required this.onButtonPress,
  });

  final IconData buttonIcon;
  final String buttonText;
  final bool isActive;
  final Function onButtonPress;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ElevatedButton.icon(
            icon: Icon(buttonIcon),
            label: Text(buttonText),
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            )),
            onPressed: () => onButtonPress(),
          )
        : TextButton.icon(
            icon: Icon(buttonIcon),
            label: Text(buttonText),
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            )),
            onPressed: () => onButtonPress());
  }
}

bool isActiveRouter(String currentPath, String path) {
  return currentPath == path;
}
